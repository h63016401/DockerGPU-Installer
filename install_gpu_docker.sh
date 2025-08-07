#!/bin/bash

set -e

echo "🔧 更新套件與安裝基本工具..."
sudo apt update
sudo apt install -y ca-certificates curl gnupg lsb-release gnupg2 software-properties-common

echo "🐳 安裝 Docker Engine..."
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt update
sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

echo "✅ Docker 安裝完成"

echo "🧠 檢查 NVIDIA 驅動（nvidia-smi）..."
if ! command -v nvidia-smi &> /dev/null
then
    echo "❌ 錯誤：找不到 nvidia-smi，請先安裝 GPU Driver！"
    exit 1
else
    nvidia-smi
fi

echo "⚙️ 安裝 NVIDIA Container Toolkit..."
distribution=$(. /etc/os-release;echo $ID$VERSION_ID)
curl -s -L https://nvidia.github.io/libnvidia-container/gpgkey | sudo apt-key add -
curl -s -L https://nvidia.github.io/libnvidia-container/$distribution/libnvidia-container.list | \
  sudo tee /etc/apt/sources.list.d/nvidia-container-toolkit.list

sudo apt update
sudo apt install -y nvidia-docker2

echo "🔄 重新啟動 Docker..."
sudo systemctl restart docker

echo "🧪 測試 GPU 是否可在容器內使用..."
sudo docker run --rm --gpus all nvidia/cuda:12.2.0-base-ubuntu22.04 nvidia-smi

echo "🙋 將目前使用者加入 docker 群組（免 sudo）..."
sudo usermod -aG docker $USER
echo "✅ 請重新登入（或執行 newgrp docker）以套用群組變更"

echo "🎉 GPU Docker 安裝完成！可以開始使用 GPU 容器囉～"
