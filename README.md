# Rocket-PPA: A Multi-Corner, Longitudinal PPA Dataset for ML-Driven EDA

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Python 3.8+](https://img.shields.io/badge/python-3.8+-blue.svg)](https://www.python.org/downloads/)
**Rocket-PPA** is a comprehensive dataset designed to bridge the chasm between micro-architectural definition and physical sign-off in Electronic Design Automation (EDA). By providing high-fidelity, industrial-grade physical design data across a wide frequency spectrum and multiple PVT corners, this dataset addresses the critical data scarcity bottleneck in ML-for-EDA research.

This repository is maintained by the **MICS Lab at HKUST(GZ)**.

---

## 🚀 Key Features

* **Industrial-Grade Fidelity:** Generated using the Chisel-based RISC-V Rocket Chip generator and implemented through a complete RTL-to-GDSII flow using Synopsys Fusion Compiler on a commercial **TSMC 6nm** technology node.
* **Multi-Corner Variability:** Goes beyond nominal conditions by providing data across three crucial PVT corners (**Typical, Fast, Slow**), enabling the development of robust, corner-aware Unified Conditional Models.
* **Longitudinal "Glass-Box" Visibility:** Captures PPA metrics not just at sign-off, but at **5 distinct physical design stages**, enabling research into early-stage proxy modeling and multi-fidelity prediction.
* **Dynamic Frequency Scaling:** Sweeps target frequencies from **100MHz to 4GHz**, capturing the non-linear "Zero-Slack Cliff" and exponential power scaling dynamics inherent in aggressive timing closure.

---

## 📊 Dataset Composition

The dataset contains **800 unique micro-architectural configurations**. Because the 3 PVT corners are flattened into columns, the dataset conceptually covers **2,400 logical evaluation points** (800 configs $\times$ 3 corners).



### 1. Input Features
* **Architectural Parameters (12 columns):** Integer variables defining the core structure (e.g., `nBTBEntries`, `nICacheWays`, `nDCacheSets`).
* **Physical Constraints (1 column):** Target `Frequency` in MHz.

### 2. Target Labels (Naming Convention)
The CSV headers follow a structured format `<Stage>_[Corner]_<Metric>` to record longitudinal data:

* **Corner-Invariant Metrics (Area):** Formatted as `<Stage>_Total_Area` ($\mu m^2$). Since physical geometry is constant across PVT conditions, Area columns are shared.
* **Corner-Dependent Metrics (Power & Timing):** Formatted as `<Stage>_<Corner>_<Metric>`. 
    * *Corners:* `Typical`, `Fast`, `Slow`.
    * *Stages:* `floorplan`, `place_opt` (Placement), `clock_opt` (CTS), `route_opt` (Routing), `chipfinish` (Sign-off).
    * *Metrics:* `Total_Power` (mW) and `WNS` (ns, Worst Negative Slack).

*Example:* `chipfinish_Total_Area` (invariant) vs. `chipfinish_Typical_Total_Power` (corner-specific).

---

## 🛠️ Usage & Preprocessing Guidelines

Based on our exploratory data analysis, we highly recommend the following preprocessing steps when training machine learning models (e.g., XGBoost, Random Forest, or Neural Networks) on this dataset:

### Power & Area (Log-Normal Distributions)
Power and Area metrics span multiple orders of magnitude. We recommend applying a **Logarithmic Transformation** (`log(1+x)`) followed by Standard Scaling before optimization using standard MSE loss.

### Timing / WNS (The "Zero-Slack Cliff")
Timing prediction is highly non-linear. EDA tools optimize violating paths aggressively toward the $0.0$ ns threshold but leave loose constraints alone, creating a sharp distributional discontinuity. 
* **Recommendation:** Use a **Quantile Transformer** to map the raw WNS data to a Gaussian prior ($\mathcal{N}(0,1)$). Furthermore, utilizing **L1 Loss (MAE)** rather than MSE provides more stable gradients near the critical zero-slack boundary.

---

## 💻 Quick Start

Clone the repository and load the dataset using Pandas:

```bash
git clone [https://github.com/HKUSTGZ-MICS-LYU/KDD-RocketPPA-Dataset.git](https://github.com/HKUSTGZ-MICS-LYU/KDD-RocketPPA-Dataset.git)
cd KDD-RocketPPA-Dataset
