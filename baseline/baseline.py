#!/usr/bin/env python3
"""Run baseline experiments for final-stage PPA prediction."""

from __future__ import annotations

import argparse
import csv
import json
import math
import statistics
from pathlib import Path
from typing import Dict, List, Tuple


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


def parse_args() -> argparse.Namespace:
    repo_root = Path(__file__).resolve().parent.parent
    parser = argparse.ArgumentParser(description="Run baseline benchmark experiments.")
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


def standardize_fit(x: List[List[float]]) -> Tuple[List[float], List[float]]:
    cols = list(zip(*x))
    means = [statistics.fmean(col) for col in cols]
    stds = []
    for col, mean in zip(cols, means):
        var = statistics.fmean((value - mean) ** 2 for value in col)
        stds.append(math.sqrt(var) if var > 0 else 1.0)
    return means, stds


def standardize_apply(x: List[List[float]], means: List[float], stds: List[float]) -> List[List[float]]:
    return [[(value - mean) / std for value, mean, std in zip(row, means, stds)] for row in x]


def add_bias(x: List[List[float]]) -> List[List[float]]:
    return [[1.0] + row for row in x]


def transpose(x: List[List[float]]) -> List[List[float]]:
    return [list(col) for col in zip(*x)]


def matmul(a: List[List[float]], b: List[List[float]]) -> List[List[float]]:
    b_t = transpose(b)
    return [[sum(ai * bj for ai, bj in zip(row, col)) for col in b_t] for row in a]


def identity(n: int) -> List[List[float]]:
    return [[1.0 if i == j else 0.0 for j in range(n)] for i in range(n)]


def inverse(matrix: List[List[float]]) -> List[List[float]]:
    n = len(matrix)
    aug = [row[:] + eye_row[:] for row, eye_row in zip(matrix, identity(n))]
    for col in range(n):
        pivot = max(range(col, n), key=lambda r: abs(aug[r][col]))
        if abs(aug[pivot][col]) < 1e-12:
            raise ValueError("Matrix is singular and cannot be inverted.")
        aug[col], aug[pivot] = aug[pivot], aug[col]
        pivot_val = aug[col][col]
        aug[col] = [value / pivot_val for value in aug[col]]
        for row in range(n):
            if row == col:
                continue
            factor = aug[row][col]
            aug[row] = [rv - factor * cv for rv, cv in zip(aug[row], aug[col])]
    return [row[n:] for row in aug]


def ridge_regression_fit(x: List[List[float]], y: List[float], alpha: float = 1e-6) -> List[float]:
    x_bias = add_bias(x)
    xt = transpose(x_bias)
    xtx = matmul(xt, x_bias)
    for i in range(len(xtx)):
        xtx[i][i] += alpha
    xtx_inv = inverse(xtx)
    y_col = [[value] for value in y]
    xty = matmul(xt, y_col)
    weights = matmul(xtx_inv, xty)
    return [row[0] for row in weights]


def predict(x: List[List[float]], weights: List[float]) -> List[float]:
    x_bias = add_bias(x)
    return [sum(w * v for w, v in zip(weights, row)) for row in x_bias]


def invert_target_transform(values: List[float], mode: str) -> List[float]:
    if mode == "log":
        return [math.expm1(value) for value in values]
    return values[:]


def mae(y_true: List[float], y_pred: List[float]) -> float:
    return statistics.fmean(abs(a - b) for a, b in zip(y_true, y_pred))


def rmse(y_true: List[float], y_pred: List[float]) -> float:
    return math.sqrt(statistics.fmean((a - b) ** 2 for a, b in zip(y_true, y_pred)))


def r2_score(y_true: List[float], y_pred: List[float]) -> float:
    y_mean = statistics.fmean(y_true)
    ss_res = sum((a - b) ** 2 for a, b in zip(y_true, y_pred))
    ss_tot = sum((a - y_mean) ** 2 for a in y_true)
    return 1.0 - ss_res / ss_tot if ss_tot > 0 else 0.0


def run_one_setting(rows: List[Dict[str, str]], train_ids: List[str], val_ids: List[str], test_ids: List[str],
                    feature_cols: List[str], target_col: str, target_mode: str) -> Dict[str, float]:
    filtered = filter_complete_rows(rows, feature_cols, target_col)
    train_rows = rows_for_designs(filtered, train_ids)
    val_rows = rows_for_designs(filtered, val_ids)
    test_rows = rows_for_designs(filtered, test_ids)

    train_val_rows = train_rows + val_rows
    x_train, y_train = build_matrix(train_val_rows, feature_cols, target_col, target_mode)
    x_test, y_test = build_matrix(test_rows, feature_cols, target_col, target_mode)

    means, stds = standardize_fit(x_train)
    x_train_std = standardize_apply(x_train, means, stds)
    x_test_std = standardize_apply(x_test, means, stds)

    weights = ridge_regression_fit(x_train_std, y_train)
    y_pred = predict(x_test_std, weights)

    y_true_eval = invert_target_transform(y_test, target_mode)
    y_pred_eval = invert_target_transform(y_pred, target_mode)

    return {
        "train_samples": len(train_rows),
        "val_samples": len(val_rows),
        "test_samples": len(test_rows),
        "feature_count": len(feature_cols),
        "mae": mae(y_true_eval, y_pred_eval),
        "rmse": rmse(y_true_eval, y_pred_eval),
        "r2": r2_score(y_true_eval, y_pred_eval),
    }


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

    print(f"Results written to: {output_dir / 'baseline_results.json'}")


if __name__ == "__main__":
    main()
