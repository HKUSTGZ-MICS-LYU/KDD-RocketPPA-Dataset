# MLCAD Multimodal Processor PPA Dataset

## Overview

This repository releases a multimodal processor PPA dataset for ML-driven EDA. The dataset covers two processor families:

- `RocketChip`
- `VexiiRiscv`

For each family, the release includes three aligned modalities:

- tabular backend PPA annotations
- GDSII-derived images
- generated RTL code

The dataset is intended to support research on final-stage PPA prediction, backend-stage-aware learning, cross-family generalization, and multimodal modeling over architecture, backend signals, and layout geometry.

## Released Contents

According to the current release policy, the repository keeps the following dataset files:

- `RocketChipPPAResult/`
- `VexiiRiscvPPAResult/`
- `RocketChipGDSII/`
- `VexiiRiscvGDSII/`
- `RocketChipRTLCode/`
- `VexiiRiscvRTLCode/`
- `baseline/baseline.py`
- `README.md`
- `LICENSE`

All paper writing files, analysis artifacts, generated figures, and auxiliary scripts are excluded from the dataset release.

## Dataset Scale

### RocketChip

- `200` unique designs
- `800` tabular samples
- frequencies: `100 MHz`, `800 MHz`, `1600 MHz`, `4000 MHz`
- `797` paired GDSII images
- `200` RTL files in the released directory

### VexiiRiscv

- `200` unique designs
- `600` tabular samples
- frequencies: `100 MHz`, `400 MHz`, `800 MHz`
- `593` paired GDSII images
- `200` RTL files in the released directory

### Combined

- `400` unique designs
- `1400` tabular samples
- `1390` paired GDSII images

The small difference between tabular rows and paired GDSII images is caused by failed backend runs. These failed runs do not have complete final-stage annotations and therefore are excluded from the paired image branch.

## Directory Structure

```text
MLCAD/
├── RocketChipPPAResult/
│   └── RocketChip_PPA_Data.csv
├── VexiiRiscvPPAResult/
│   └── VexiiRiscv_PPA_Data.csv
├── RocketChipGDSII/
│   └── *.png
├── VexiiRiscvGDSII/
│   └── *.png
├── RocketChipRTLCode/
│   └── *.sv
├── VexiiRiscvRTLCode/
│   └── *.v
└── baseline/
    └── baseline.py
```

## Tabular PPA Annotations

### RocketChip

The RocketChip CSV contains:

- `12` architecture feature columns
- `1` frequency column
- `35` target columns

Representative architecture features include:

- `nBTBEntries`
- `nICacheWays`
- `nDCacheSets`
- `MulDivUnroll`

### VexiiRiscv

The VexiiRiscv CSV contains:

- `37` architecture feature columns
- `1` frequency column
- `35` target columns

Representative architecture features include:

- `xlen`
- `decoders`
- `lanes`
- `with-mul`
- `with-div`
- `btb-sets`

### Shared Target Schema

Both processor families use aligned backend supervision:

- backend stages: `floorplan`, `placement`, `cts`, `route`, `chipfinish`
- PVT corners for power and timing: `Fast`, `Typical`, `Slow`
- target groups:
  - area
  - power
  - WNS

Each processor family provides:

- `5` area labels
- `15` power labels
- `15` WNS labels

for a total of `35` target columns.

## GDSII Image Modality

The repository distributes GDSII-derived images in rasterized `PNG` format. This design choice is made because raw GDSII files are too large for practical public release through GitHub.

Each GDSII image is keyed by:

- design ID
- operating frequency

and is aligned with one complete tabular backend sample.

The original raw GDSII files can be released separately to researchers in a later distribution or upon request.

## RTL Modality

The release also includes generated RTL code:

- `RocketChipRTLCode/`
- `VexiiRiscvRTLCode/`

This makes it possible to study the connection between front-end RTL structure and downstream physical-design behavior.

## Example Baseline

The repository keeps a lightweight example baseline in:

- `baseline/baseline.py`

This script runs final-stage PPA prediction experiments for RocketChip and VexiiRiscv using two settings:

- `ArchOnly`
- `ArchPlusBackendStage`

and outputs benchmark results in JSON form.

## Suggested Research Tasks

This dataset can support:

- final-stage PPA prediction from architecture parameters
- backend-stage-aware prediction
- cross-family generalization
- multi-fidelity learning across backend stages
- resource-aware backend-stage selection
- multimodal learning with architecture, backend features, and GDSII images
- joint RTL-to-layout representation learning

## License

This repository is released under the license provided in [LICENSE](LICENSE).
