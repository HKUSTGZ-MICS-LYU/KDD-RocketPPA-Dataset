import pandas as pd
import numpy as np
import xgboost as xgb
from sklearn.ensemble import RandomForestRegressor
from sklearn.metrics import r2_score, mean_absolute_percentage_error
import matplotlib.pyplot as plt
import seaborn as sns
import os

# ==========================================
# 1. Data Loading & Preprocessing
# ==========================================
def load_and_process_data():
    # 1. Define the list of file names
    files = [
        "../PPAResult/Rocket_Dataset_100M.csv",
        "../PPAResult/Rocket_Dataset_800M.csv",
        "../PPAResult/Rocket_Dataset_1600M.csv",
        "../PPAResult/Rocket_Dataset_4000M.csv"
    ]
    
    dfs = []
    print(">>> Starting data loading...")
    for f in files:
        if os.path.exists(f):
            try:
                # Read CSV
                df = pd.read_csv(f)
                
                # If there is no Frequency column in the CSV, add it based on the file name (optional)
                if 'Frequency' not in df.columns:
                    if '100M' in f: df['Frequency'] = 100
                    elif '800M' in f: df['Frequency'] = 800
                    elif '1600M' in f: df['Frequency'] = 1600
                    elif '4000M' in f: df['Frequency'] = 4000
                
                dfs.append(df)
                print(f"    Successfully loaded: {f} (Shape: {df.shape})")
            except Exception as e:
                print(f"    Failed to load {f}: {e}")
        else:
            print(f"    Warning: File does not exist {f}")
    
    if not dfs:
        raise ValueError("No data loaded! Please check if these CSV files exist in the current directory.")
        
    full_df = pd.concat(dfs, ignore_index=True)
    
    # 2. Critical Step: Assign Design_ID (for leak-free splitting)
    # We identify the "same design" based on a combination of 12 architectural parameters
    arch_features = [
        'nRAS', 'nBTBEntries', 'nBHTEntries', 'nICacheSets', 
        'nICacheWays', 'nICacheTLBWays', 'MulDivUnroll', 
        'useVM', 'nDCacheSets', 'nDCacheWays', 
        'nDCacheTLBWays', 'nMSHRs'
    ]
    
    # Check if columns exist
    missing_cols = [c for c in arch_features if c not in full_df.columns]
    if missing_cols:
        raise ValueError(f"Missing architectural parameter columns in CSV: {missing_cols}")

    print(">>> Generating Design ID for dataset splitting...")
    # Generate unique Design_ID by grouping architectural parameters
    full_df['Design_ID'] = full_df.groupby(arch_features).ngroup()
    
    n_designs = full_df['Design_ID'].nunique()
    print(f"    Total data size: {len(full_df)}")
    print(f"    Unique Designs: {n_designs}")
    
    # 3. Ensure Corner feature is included
    # If Corner in your data is a string (e.g., 'TT', 'SS'), it needs to be converted to a numeric ID
    if 'Corner_ID' not in full_df.columns:
        # Try to find the Corner column
        possible_corner_cols = [c for c in full_df.columns if 'corner' in c.lower()]
        if possible_corner_cols:
            col = possible_corner_cols[0]
            print(f"    Detected Corner column: {col}, encoding as Corner_ID...")
            full_df['Corner_ID'] = full_df[col].astype('category').cat.codes
        else:
            # If there is no Corner column at all, assume the data is single Corner or the user needs to handle it manually
            print("    Note: 'Corner_ID' column not found. If this is multi-corner data, please ensure there is a column identifying the Corner.")
            # To prevent code errors, if it's single Corner data, set to 0
            full_df['Corner_ID'] = 0

    return full_df.dropna().reset_index(drop=True)

# ==========================================
# 2. Dataset Splitting Strategy (Split by Design ID)
# ==========================================
def split_by_design(df, train_ratio=0.56, val_ratio=0.14):
    """
    Split by Design_ID to ensure all Frequency/Corner data of the same design do not cross sets.
    """
    unique_ids = df['Design_ID'].unique()
    np.random.seed(42)
    np.random.shuffle(unique_ids)
    
    n_total = len(unique_ids)
    n_train = int(n_total * train_ratio)
    n_val = int(n_total * val_ratio)
    
    train_ids = unique_ids[:n_train]
    val_ids = unique_ids[n_train:n_train+n_val]
    test_ids = unique_ids[n_train+n_val:]
    
    print(f"\n>>> Dataset splitting statistics:")
    print(f"    Train Designs: {len(train_ids)}")
    print(f"    Val   Designs: {len(val_ids)}")
    print(f"    Test  Designs: {len(test_ids)}")
    
    df_train = df[df['Design_ID'].isin(train_ids)].copy()
    df_val = df[df['Design_ID'].isin(val_ids)].copy()
    df_test = df[df['Design_ID'].isin(test_ids)].copy()
    
    return df_train, df_val, df_test

# ==========================================
# 3. Main Training Pipeline
# ==========================================
# Load data
try:
    df_full = load_and_process_data()
except ValueError as e:
    print(f"Error: {e}")
    exit()

# Split data
df_train, df_val, df_test = split_by_design(df_full)

# Combine Train and Val for final training (for better performance), or you can keep Val for hyperparameter tuning
# Here we follow common practice: train with as much data as possible before evaluating on Test
X_train_full = pd.concat([df_train, df_val])
y_train_full = pd.concat([df_train, df_val]) # y needs to be fetched dynamically based on the target

# Define features (ensure they match CSV column names)
features = [
    'nRAS', 'nBTBEntries', 'nBHTEntries', 'nICacheSets', 
    'nICacheWays', 'nICacheTLBWays', 'MulDivUnroll', 
    'useVM', 'nDCacheSets', 'nDCacheWays', 
    'nDCacheTLBWays', 'nMSHRs', 'Frequency', 
    'Corner_ID'  # Key feature for the unified model
]

# Define targets (please modify here according to the actual column names in your CSV!)
# Example column names: 'chipfinish_Total_Area', 'chipfinish_Typical_Total_Power(nW)'
# If your column names are different, please modify the dictionary values here
targets = {
    'Area': 'chipfinish_Total_Area',
    'Power': 'chipfinish_Typical_Total_Power(nW)',
    'WNS': 'chipfinish_FUNC_Typical_(Setup)_WNS'
}

metrics_log = []
sns.set_style("whitegrid")
sns.set_context("paper", font_scale=1.4)

for metric_name, col_name in targets.items():
    if col_name not in df_full.columns:
        print(f"Skipping {metric_name}: Column name '{col_name}' not found in CSV.")
        continue

    print(f"\n>>> Training target: {metric_name} ...")
    
    # Prepare X, y
    X_train = X_train_full[features]
    y_train = X_train_full[col_name]
    
    X_test = df_test[features]
    y_test = df_test[col_name]
    
    # --- Model 1: Random Forest ---
    rf = RandomForestRegressor(n_estimators=100, random_state=42, n_jobs=-1)
    rf.fit(X_train, y_train)
    rf_pred = rf.predict(X_test)
    
    rf_r2 = r2_score(y_test, rf_pred)
    rf_mape = mean_absolute_percentage_error(y_test, rf_pred)
    metrics_log.append(f"Model: RF | Target: {metric_name} | R2: {rf_r2:.4f} | MAPE: {rf_mape:.4%}")
    
    # Plot RF
    plt.figure(figsize=(6, 6))
    # Color by Corner_ID to observe predictions across different corners
    sns.scatterplot(x=y_test, y=rf_pred, hue=X_test['Corner_ID'], palette='viridis', alpha=0.6)
    min_v, max_v = min(y_test.min(), rf_pred.min()), max(y_test.max(), rf_pred.max())
    plt.plot([min_v, max_v], [min_v, max_v], 'r--', lw=2, label='Ideal')
    plt.title(f'Random Forest: {metric_name}\n($R^2={rf_r2:.3f}$)', fontweight='bold')
    plt.xlabel('Actual')
    plt.ylabel('Predicted')
    plt.legend(title='Corner')
    plt.tight_layout()
    plt.savefig(f"RF_{metric_name}_RealData.png", dpi=300)
    plt.close()

    # --- Model 2: XGBoost ---
    xg = xgb.XGBRegressor(n_estimators=100, learning_rate=0.1, max_depth=6, n_jobs=-1, random_state=42)
    xg.fit(X_train, y_train)
    xg_pred = xg.predict(X_test)
    
    xg_r2 = r2_score(y_test, xg_pred)
    xg_mape = mean_absolute_percentage_error(y_test, xg_pred)
    metrics_log.append(f"Model: XGB | Target: {metric_name} | R2: {xg_r2:.4f} | MAPE: {xg_mape:.4%}")
    metrics_log.append("-" * 30)
    
    # Plot XGB
    plt.figure(figsize=(6, 6))
    sns.scatterplot(x=y_test, y=xg_pred, hue=X_test['Corner_ID'], palette='viridis', alpha=0.6)
    plt.plot([min_v, max_v], [min_v, max_v], 'r--', lw=2, label='Ideal')
    plt.title(f'XGBoost: {metric_name}\n($R^2={xg_r2:.3f}$)', fontweight='bold')
    plt.xlabel('Actual')
    plt.ylabel('Predicted')
    plt.legend(title='Corner')
    plt.tight_layout()
    plt.savefig(f"XGB_{metric_name}_RealData.png", dpi=300)
    plt.close()

# Save metrics
with open('metrics_real_data.txt', 'w') as f:
    f.write("\n".join(metrics_log))

print("\n>>> All done!")
print("    Images saved: RF_*.png, XGB_*.png")
print("    Metrics saved: metrics_real_data.txt")
print("    Metrics preview:")
for line in metrics_log:
    print("    " + line)