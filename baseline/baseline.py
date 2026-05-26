#!/usr/bin/env python
"""Run XGBoost baseline experiments for final-stage PPA prediction."""

from __future__ import annotations

import argparse
import csv
import html
import json
import math
import statistics
from pathlib import Path
from typing import Dict, List, Tuple

import xgboost as xgb


DATASET_SPECS = {
    "RocketChip": {
        "csv": "RocketChipPPAResult/RocketChip_PPA_Data.csv",
        "arch_features": [
            "nRAS", "nBTBEntries", "nBHTEntries", "nICacheSets", "nICacheWays", "nICacheTLBWays",
            "MulDivUnroll", "useVM", "nDCacheSets", "nDCacheWays", "nDCacheTLBWays", "nMSHRs", "Frequency",
        ],
        "stage_features": [
            "floorplan_Total_Area", "placement_Total_Area", "cts_Total_Area", "route_Total_Area",
            "floorplan_Typical_Total_Power(nW)", "placement_Typical_Total_Power(nW)",
            "cts_Typical_Total_Power(nW)", "route_Typical_Total_Power(nW)",
            "floorplan_FUNC_Typical_(Setup)_WNS", "placement_FUNC_Typical_(Setup)_WNS",
            "cts_FUNC_Typical_(Setup)_WNS", "route_FUNC_Typical_(Setup)_WNS",
        ],
        "targets": {
            "Area": ("chipfinish_Total_Area", "log"),
            "Power": ("chipfinish_Typical_Total_Power(nW)", "log"),
            "WNS": ("chipfinish_FUNC_Typical_(Setup)_WNS", "raw"),
        },
    },
    "VexiiRiscv": {
        "csv": "VexiiRiscvPPAResult/VexiiRiscv_PPA_Data.csv",
        "arch_features": [
            "xlen", "decoders", "lanes", "decoder-at", "dispatcher-at", "relaxed-branch", "relaxed-shift",
            "relaxed-btb", "with-mul", "with-div", "with-rvc", "with-aligner-buffer", "with-dispatcher-buffer",
            "with-gshare", "with-btb", "with-ras", "with-late-alu", "btb-sets", "btb-hash-width",
            "regfile-async", "allow-bypass-from", "fetch-l1", "lsu-l1", "fetch-l1-sets", "fetch-l1-ways",
            "fetch-l1-mem-data-width-min", "fetch-reduced-bank", "lsu-l1-sets", "lsu-l1-ways",
            "lsu-l1-store-buffer-slots", "lsu-l1-store-buffer-ops", "lsu-l1-refill-count",
            "lsu-l1-writeback-count", "with-lsu-bypass", "with-iterative-shift", "div-radix", "div-ipc", "Frequency",
        ],
        "stage_features": [
            "floorplan_Cell_Area", "placement_Cell_Area", "cts_Cell_Area", "route_Cell_Area",
            "floorplan_Typical_Power", "placement_Typical_Power", "cts_Typical_Power", "route_Typical_Power",
            "floorplan_Typical_WNS", "placement_Typical_WNS", "cts_Typical_WNS", "route_Typical_WNS",
        ],
        "targets": {
            "Area": ("chipfinish_Cell_Area", "log"),
            "Power": ("chipfinish_Typical_Power", "log"),
            "WNS": ("chipfinish_Typical_WNS", "raw"),
        },
    },
}


BAR_COLORS = {
    "ArchOnly": "#D55C3A",
    "ArchPlusBackendStage": "#2A7F9E",
}


def parse_args() -> argparse.Namespace:
    repo_root = Path(__file__).resolve().parent.parent
    parser = argparse.ArgumentParser(description="Run XGBoost baseline benchmark experiments.")
    parser.add_argument(
        "--repo-root",
        type=Path,
        default=repo_root,
        help="Repository root.",
    )
    parser.add_argument(
        "--output-dir",
        type=Path,
        default=repo_root / "baseline",
        help="Directory for experiment outputs.",
    )
    return parser.parse_args()


def read_rows(path: Path) -> List[Dict[str, str]]:
    with path.open("r", newline="", encoding="utf-8") as handle:
        return list(csv.DictReader(handle))


def parse_scalar(value: str) -> float:
    try:
        return float(value)
    except ValueError:
        digits = "".join(ch for ch in value if (ch.isdigit() or ch == "."))
        if digits:
            return float(digits)
        raise


def group_by_design(rows: List[Dict[str, str]]) -> Dict[str, List[Dict[str, str]]]:
    grouped: Dict[str, List[Dict[str, str]]] = {}
    for row in rows:
        grouped.setdefault(row["Design"], []).append(row)
    return grouped


def split_designs(design_ids: List[str]) -> Tuple[List[str], List[str], List[str]]:
    ordered = sorted(design_ids)
    train = ordered[:112]
    val = ordered[112:140]
    test = ordered[140:]
    return train, val, test


def filter_complete_rows(rows: List[Dict[str, str]], feature_cols: List[str], target_col: str) -> List[Dict[str, str]]:
    required = feature_cols + [target_col]
    return [row for row in rows if all(row.get(col, "") != "" for col in required)]


def rows_for_designs(rows: List[Dict[str, str]], design_ids: List[str]) -> List[Dict[str, str]]:
    keep = set(design_ids)
    return [row for row in rows if row["Design"] in keep]


def build_matrix(rows: List[Dict[str, str]], feature_cols: List[str], target_col: str, target_mode: str) -> Tuple[List[List[float]], List[float]]:
    x = [[parse_scalar(row[col]) for col in feature_cols] for row in rows]
    y = []
    for row in rows:
        value = parse_scalar(row[target_col])
        y.append(math.log1p(value) if target_mode == "log" else value)
    return x, y


def invert_target_transform(values: List[float], mode: str) -> List[float]:
    if mode == "log":
        return [math.expm1(value) for value in values]
    return values[:]


def mae(y_true: List[float], y_pred: List[float]) -> float:
    return statistics.fmean(abs(a - b) for a, b in zip(y_true, y_pred))


def rmse(y_true: List[float], y_pred: List[float]) -> float:
    return math.sqrt(statistics.fmean((a - b) ** 2 for a, b in zip(y_true, y_pred)))


def mape(y_true: List[float], y_pred: List[float]) -> float:
    eps = 1e-12
    return 100.0 * statistics.fmean(abs((a - b) / max(abs(a), eps)) for a, b in zip(y_true, y_pred))


def r2_score(y_true: List[float], y_pred: List[float]) -> float:
    y_mean = statistics.fmean(y_true)
    ss_res = sum((a - b) ** 2 for a, b in zip(y_true, y_pred))
    ss_tot = sum((a - y_mean) ** 2 for a in y_true)
    return 1.0 - ss_res / ss_tot if ss_tot > 0 else 0.0


def xgb_params(target_mode: str) -> Dict[str, object]:
    params = {
        "objective": "reg:squarederror",
        "eta": 0.05,
        "max_depth": 6,
        "subsample": 0.85,
        "colsample_bytree": 0.85,
        "min_child_weight": 1.0,
        "lambda": 1.0,
        "alpha": 0.0,
        "seed": 42,
        "verbosity": 0,
        "nthread": 4,
    }
    if target_mode == "raw":
        params["max_depth"] = 5
        params["eta"] = 0.04
    return params


def run_one_setting(rows: List[Dict[str, str]], train_ids: List[str], val_ids: List[str], test_ids: List[str],
                    feature_cols: List[str], target_col: str, target_mode: str) -> Dict[str, float]:
    filtered = filter_complete_rows(rows, feature_cols, target_col)
    train_rows = rows_for_designs(filtered, train_ids)
    val_rows = rows_for_designs(filtered, val_ids)
    test_rows = rows_for_designs(filtered, test_ids)

    x_train, y_train = build_matrix(train_rows, feature_cols, target_col, target_mode)
    x_val, y_val = build_matrix(val_rows, feature_cols, target_col, target_mode)
    x_test, y_test = build_matrix(test_rows, feature_cols, target_col, target_mode)

    dtrain = xgb.DMatrix(x_train, label=y_train)
    dval = xgb.DMatrix(x_val, label=y_val)
    dtest = xgb.DMatrix(x_test, label=y_test)

    booster = xgb.train(
        params=xgb_params(target_mode),
        dtrain=dtrain,
        num_boost_round=800,
        evals=[(dtrain, "train"), (dval, "val")],
        early_stopping_rounds=40,
        verbose_eval=False,
    )

    y_pred = booster.predict(dtest)
    y_true_eval = invert_target_transform(y_test, target_mode)
    y_pred_eval = invert_target_transform(list(y_pred), target_mode)

    return {
        "train_samples": len(train_rows),
        "val_samples": len(val_rows),
        "test_samples": len(test_rows),
        "feature_count": len(feature_cols),
        "best_iteration": int(booster.best_iteration),
        "mae": float(mae(y_true_eval, y_pred_eval)),
        "mape": float(mape(y_true_eval, y_pred_eval)),
        "rmse": float(rmse(y_true_eval, y_pred_eval)),
        "r2": float(r2_score(y_true_eval, y_pred_eval)),
    }


def svg_text(x: float, y: float, text: str, size: int = 12, anchor: str = "start", weight: str = "normal",
             fill: str = "#202124") -> str:
    return (
        f'<text x="{x:.1f}" y="{y:.1f}" font-size="{size}" text-anchor="{anchor}" '
        f'font-weight="{weight}" fill="{fill}">{html.escape(text)}</text>'
    )


def svg_rect(x: float, y: float, width: float, height: float, fill: str, stroke: str = "none",
             stroke_width: float = 1, rx: float = 0) -> str:
    return (
        f'<rect x="{x:.1f}" y="{y:.1f}" width="{width:.1f}" height="{height:.1f}" '
        f'fill="{fill}" stroke="{stroke}" stroke-width="{stroke_width}" rx="{rx}"/>'
    )


def svg_line(x1: float, y1: float, x2: float, y2: float, stroke: str = "#9AA0A6", stroke_width: float = 1.0) -> str:
    return (
        f'<line x1="{x1:.1f}" y1="{y1:.1f}" x2="{x2:.1f}" y2="{y2:.1f}" '
        f'stroke="{stroke}" stroke-width="{stroke_width}"/>'
    )


def svg_document(width: int, height: int, elements: List[str]) -> str:
    style = """
    <style>
      text { font-family: "Times New Roman", "Times", serif; }
    </style>
    """
    return (
        f'<svg xmlns="http://www.w3.org/2000/svg" width="{width}" height="{height}" '
        f'viewBox="0 0 {width} {height}">{style}{"".join(elements)}</svg>'
    )


def pdf_escape(text: str) -> str:
    return text.replace("\\", "\\\\").replace("(", "\\(").replace(")", "\\)")


def svg_elements_to_pdf_ops(width: int, height: int, elements: List[str]) -> str:
    import xml.etree.ElementTree as ET

    svg = svg_document(width, height, elements)
    root = ET.fromstring(svg)
    ops: List[str] = []

    def color_to_rgb(value: str) -> Tuple[float, float, float]:
        if not value or value == "none":
            return (0.0, 0.0, 0.0)
        if value.startswith("#") and len(value) == 7:
            r = int(value[1:3], 16) / 255.0
            g = int(value[3:5], 16) / 255.0
            b = int(value[5:7], 16) / 255.0
            return (r, g, b)
        return (0.0, 0.0, 0.0)

    def fy(y: float) -> float:
        return height - y

    def rect_path(x: float, y: float, w: float, h: float) -> List[str]:
        top = fy(y)
        bottom = fy(y + h)
        return [
            f"{x:.3f} {top:.3f} m",
            f"{x + w:.3f} {top:.3f} l",
            f"{x + w:.3f} {bottom:.3f} l",
            f"{x:.3f} {bottom:.3f} l",
            "h",
        ]

    for node in root:
        tag = node.tag.split("}")[-1]
        if tag == "style":
            continue
        if tag == "rect":
            x = float(node.attrib.get("x", "0"))
            y = float(node.attrib.get("y", "0"))
            w = float(node.attrib.get("width", "0"))
            h = float(node.attrib.get("height", "0"))
            fill = node.attrib.get("fill", "none")
            stroke = node.attrib.get("stroke", "none")
            stroke_width = float(node.attrib.get("stroke-width", "1"))
            path_ops = rect_path(x, y, w, h)
            if fill != "none":
                r, g, b = color_to_rgb(fill)
                ops.append(f"{r:.4f} {g:.4f} {b:.4f} rg")
                ops.extend(path_ops)
                if stroke != "none":
                    rs, gs, bs = color_to_rgb(stroke)
                    ops.append(f"{rs:.4f} {gs:.4f} {bs:.4f} RG")
                    ops.append(f"{stroke_width:.3f} w")
                    ops.append("B")
                else:
                    ops.append("f")
        elif tag == "line":
            x1 = float(node.attrib["x1"])
            y1 = fy(float(node.attrib["y1"]))
            x2 = float(node.attrib["x2"])
            y2 = fy(float(node.attrib["y2"]))
            stroke = node.attrib.get("stroke", "#000000")
            stroke_width = float(node.attrib.get("stroke-width", "1"))
            r, g, b = color_to_rgb(stroke)
            ops.append(f"{r:.4f} {g:.4f} {b:.4f} RG")
            ops.append(f"{stroke_width:.3f} w")
            ops.append(f"{x1:.3f} {y1:.3f} m {x2:.3f} {y2:.3f} l S")
        elif tag == "text":
            x = float(node.attrib.get("x", "0"))
            y = fy(float(node.attrib.get("y", "0")))
            size = float(node.attrib.get("font-size", "10"))
            anchor = node.attrib.get("text-anchor", "start")
            fill = node.attrib.get("fill", "#000000")
            weight = node.attrib.get("font-weight", "normal")
            text = "".join(node.itertext())
            if not text:
                continue
            r, g, b = color_to_rgb(fill)
            width_est = len(text) * size * 0.52
            x_pos = x
            if anchor == "middle":
                x_pos = x - width_est / 2
            elif anchor == "end":
                x_pos = x - width_est
            font_name = "F2" if weight == "bold" else "F1"
            ops.append("BT")
            ops.append(f"/{font_name} {size:.2f} Tf")
            ops.append(f"{r:.4f} {g:.4f} {b:.4f} rg")
            ops.append(f"1 0 0 1 {x_pos:.3f} {y:.3f} Tm")
            ops.append(f"({pdf_escape(text)}) Tj")
            ops.append("ET")

    return "\n".join(ops)


def write_pdf(path: Path, width: int, height: int, elements: List[str]) -> None:
    content = svg_elements_to_pdf_ops(width, height, elements).encode("latin-1", errors="replace")
    objects: List[bytes] = []
    objects.append(b"<< /Type /Catalog /Pages 2 0 R >>")
    objects.append(b"<< /Type /Pages /Kids [3 0 R] /Count 1 >>")
    page = (
        f"<< /Type /Page /Parent 2 0 R /MediaBox [0 0 {width} {height}] "
        f"/Resources << /Font << /F1 4 0 R /F2 5 0 R >> >> /Contents 6 0 R >>"
    ).encode("latin-1")
    objects.append(page)
    objects.append(b"<< /Type /Font /Subtype /Type1 /BaseFont /Times-Roman >>")
    objects.append(b"<< /Type /Font /Subtype /Type1 /BaseFont /Times-Bold >>")
    stream = b"<< /Length " + str(len(content)).encode("ascii") + b" >>\nstream\n" + content + b"\nendstream"
    objects.append(stream)

    pdf = bytearray(b"%PDF-1.4\n%\xe2\xe3\xcf\xd3\n")
    offsets = []
    for idx, obj in enumerate(objects, start=1):
        offsets.append(len(pdf))
        pdf.extend(f"{idx} 0 obj\n".encode("ascii"))
        pdf.extend(obj)
        pdf.extend(b"\nendobj\n")
    xref_offset = len(pdf)
    pdf.extend(f"xref\n0 {len(objects) + 1}\n".encode("ascii"))
    pdf.extend(b"0000000000 65535 f \n")
    for offset in offsets:
        pdf.extend(f"{offset:010d} 00000 n \n".encode("ascii"))
    pdf.extend(
        (
            f"trailer << /Size {len(objects) + 1} /Root 1 0 R >>\n"
            f"startxref\n{xref_offset}\n%%EOF\n"
        ).encode("ascii")
    )
    with path.open("wb") as handle:
        handle.write(pdf)


def generate_comparison_figure(results: Dict[str, object], output_path: Path) -> None:
    width = 980
    height = 420
    left_margin = 36
    top_margin = 72
    panel_gap = 18
    panel_width = (width - left_margin * 2 - panel_gap * 2) / 3
    panel_height = 270
    datasets = ["RocketChip", "VexiiRiscv"]
    panels = [("Area $R^2$", "Area"), ("Power $R^2$", "Power"), ("WNS $R^2$", "WNS")]

    elements = [
        svg_rect(0, 0, width, height, "#FFFFFF"),
        svg_text(18, 26, "Baseline Comparison Across Processor Families", size=16, weight="bold"),
        svg_text(18, 46, "Comparing architecture-only inputs against architecture plus backend-stage features.", size=9, fill="#5F6368"),
    ]

    legend_x = width - 230
    legend_y = 22
    elements.append(svg_rect(legend_x, legend_y - 8, 12, 12, BAR_COLORS["ArchOnly"], rx=2))
    elements.append(svg_text(legend_x + 18, legend_y + 1, "ArchOnly", size=9))
    elements.append(svg_rect(legend_x + 88, legend_y - 8, 12, 12, BAR_COLORS["ArchPlusBackendStage"], rx=2))
    elements.append(svg_text(legend_x + 106, legend_y + 1, "ArchPlusBackendStage", size=9))

    for panel_idx, (title, target_name) in enumerate(panels):
        px = left_margin + panel_idx * (panel_width + panel_gap)
        py = top_margin
        elements.append(svg_rect(px, py, panel_width, panel_height, "#FFFFFF", "#D1D5DB", 0.8, 6))
        elements.append(svg_text(px + 10, py + 18, title, size=11, weight="bold"))

        vals = []
        for dataset_name in datasets:
            for setup_name in ["ArchOnly", "ArchPlusBackendStage"]:
                vals.append(results["datasets"][dataset_name]["targets"][target_name]["setups"][setup_name]["r2"])
        max_val = max(vals)
        vmin = 0.0
        vmax = max(0.05, max_val * 1.08)

        x0 = px + 40
        y0 = py + 34
        cw = panel_width - 56
        ch = panel_height - 62
        elements.append(svg_line(x0, y0, x0, y0 + ch, "#6B7280", 1.0))
        elements.append(svg_line(x0, y0 + ch, x0 + cw, y0 + ch, "#6B7280", 1.0))

        def my(val: float) -> float:
            return y0 + ch - (val - vmin) / (vmax - vmin) * ch

        y_zero = my(0.0)
        elements.append(svg_line(x0, y_zero, x0 + cw, y_zero, "#9AA0A6", 0.9))

        for tick_ratio in [0.0, 0.25, 0.5, 0.75, 1.0]:
            actual = vmin + (vmax - vmin) * tick_ratio
            y = my(actual)
            elements.append(svg_line(x0, y, x0 + cw, y, "#E5E7EB", 0.6))
            elements.append(svg_text(x0 - 6, y + 3, f"{actual:.2f}", size=7, anchor="end", fill="#6B7280"))

        group_centers = [x0 + cw * 0.28, x0 + cw * 0.72]
        bar_width = 26
        offsets = [-18, 18]

        for dataset_idx, dataset_name in enumerate(datasets):
            cx = group_centers[dataset_idx]
            elements.append(svg_text(cx, y0 + ch + 16, dataset_name, size=8, anchor="middle"))
            for setup_idx, setup_name in enumerate(["ArchOnly", "ArchPlusBackendStage"]):
                value = results["datasets"][dataset_name]["targets"][target_name]["setups"][setup_name]["r2"]
                plot_value = max(0.0, value)
                x = cx + offsets[setup_idx] - bar_width / 2
                y_val = my(plot_value)
                top = min(y_zero, y_val)
                height_val = max(abs(y_zero - y_val), 1.0)
                elements.append(svg_rect(x, top, bar_width, height_val, BAR_COLORS[setup_name], rx=2))
                label_y = top - 6
                elements.append(svg_text(x + bar_width / 2, label_y, f"{value:.3f}", size=7, anchor="middle"))

    write_pdf(output_path, width, height, elements)


def main() -> None:
    args = parse_args()
    repo_root = args.repo_root.resolve()
    output_dir = args.output_dir.resolve()
    output_dir.mkdir(parents=True, exist_ok=True)

    results = {"datasets": {}}
    for dataset_name, spec in DATASET_SPECS.items():
        rows = read_rows(repo_root / spec["csv"])
        design_ids = sorted(group_by_design(rows).keys())
        train_ids, val_ids, test_ids = split_designs(design_ids)
        results["datasets"][dataset_name] = {
            "split": {
                "train_designs": len(train_ids),
                "val_designs": len(val_ids),
                "test_designs": len(test_ids),
            },
            "targets": {},
        }
        setups = {
            "ArchOnly": spec["arch_features"],
            "ArchPlusBackendStage": spec["arch_features"] + spec["stage_features"],
        }
        for target_name, (target_col, target_mode) in spec["targets"].items():
            results["datasets"][dataset_name]["targets"][target_name] = {
                "target_column": target_col,
                "target_mode": target_mode,
                "setups": {},
            }
            for setup_name, feature_cols in setups.items():
                results["datasets"][dataset_name]["targets"][target_name]["setups"][setup_name] = run_one_setting(
                    rows, train_ids, val_ids, test_ids, feature_cols, target_col, target_mode
                )

    with (output_dir / "baseline_results.json").open("w", encoding="utf-8") as handle:
        json.dump(results, handle, indent=2)

    generate_comparison_figure(results, output_dir / "baseline_comparison.pdf")

    print(f"Results written to: {output_dir / 'baseline_results.json'}")
    print(f"Figure written to: {output_dir / 'baseline_comparison.pdf'}")


if __name__ == "__main__":
    main()
