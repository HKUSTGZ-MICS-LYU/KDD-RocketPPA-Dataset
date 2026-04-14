#!/bin/bash

# --- 配置区域 ---
# 源根目录
SRC_BASE="/nfs/share/home/tongliu/processordataset/script-eval/build"
# 目标根目录（请根据需要修改此处）
DEST_DIR="/nfs/share/home/tongliu/KDD-RocketPPA-Dataset/VexiiRTLCode"

# --- 执行逻辑 ---

# 1. 检查目标目录是否存在，不存在则创建
if [ ! -d "$DEST_DIR" ]; then
	    echo "目标目录不存在，正在创建: $DEST_DIR"
	        mkdir -p "$DEST_DIR"
fi

echo "开始复制 RTL 文件..."

# 2. 使用 find 命令查找所有符合条件的 rtl 文件夹及其内容
# -path "*/VexiiRiscv_*/rtl/*" 用于精准匹配
find "$SRC_BASE" -path "*/VexiiRiscv_*/rtl/*" -type f | while read -r file; do
    
    # 如果你想保持原有的目录结构，可以使用 cp --parents
        # 如果只想把所有文件平铺拷贝到目标文件夹，使用下面的命令：
	    cp "$file" "$DEST_DIR/"
	        
	        # 如果担心文件名冲突，建议开启下面的“保留结构”模式（取消注释，并注释掉上面的 cp）
		    # dest_subdir=$(dirname "${file#$SRC_BASE/}")
		        # mkdir -p "$DEST_DIR/$dest_subdir"
			    # cp "$file" "$DEST_DIR/$dest_subdir/"
		    done

		    echo "复制完成！文件已存至: $DEST_DIR"
