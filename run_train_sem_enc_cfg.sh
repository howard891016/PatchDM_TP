#!/bin/bash

BATCH_SIZE=$1
PATCH_SIZE=$2
IMG_SIZE=$3
DATA_PATH="datasets/ffhq256_lmdb"
EXP_NAME="exp_img_${IMG_SIZE}_patch_${PATCH_SIZE}_sem_enc_cfg"

echo "--- Start Training ---"
echo "Batch Size: ${BATCH_SIZE}"
echo "Patch Size: ${PATCH_SIZE}"
echo "Data Path: ${DATA_PATH}"
echo "Experiment Name: ${EXP_NAME}"

# 注意:
# --semantic_enc 和 --cfg 在原始指令中是作為 Flag (布林/開關) 存在的
# 因此我們直接將它們包含在指令中。
python train.py \
    --batch_size "${BATCH_SIZE}" \
    --patch_size "${PATCH_SIZE}" \
    --data_path "${DATA_PATH}" \
    --name "${EXP_NAME}" \
    --semantic_enc \
    --cfg

# 檢查上一個指令 (python train.py) 的退出狀態
if [ $? -eq 0 ]; then
    echo "--- Train Success ---"
else
    echo "--- Train Failed ---"
fi