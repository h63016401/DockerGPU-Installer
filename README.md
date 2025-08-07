# 🚀 DockerGPU-Installer / GPU Docker 安裝工具

A one-click setup script for enabling NVIDIA GPU support in Docker on Ubuntu.  
這是一個一鍵安裝腳本，可在 Ubuntu 中啟用 Docker 的 NVIDIA GPU 支援。

This project helps developers and researchers quickly configure GPU-based Docker environments using NVIDIA Container Toolkit.  
本專案協助開發者與研究人員快速配置支援 GPU 的 Docker 環境，使用 NVIDIA Container Toolkit 技術。

---

## 🧩 Features / 功能特色

- ✅ Installs Docker Engine and Docker Compose (plugin version)  
  安裝 Docker 引擎與新版 Docker Compose（plugin 模式）
- ✅ Enables NVIDIA GPU support via `nvidia-docker2`  
  使用 `nvidia-docker2` 啟用 NVIDIA GPU 支援
- ✅ Tests CUDA availability inside containers  
  自動測試容器內是否能使用 CUDA GPU
- ✅ Adds current user to the `docker` group  
  將目前使用者加入 `docker` 群組，之後可免 `sudo` 使用 Docker

---

## 📦 Requirements / 系統需求

- Ubuntu 18.04 / 20.04 / 22.04
- NVIDIA GPU with drivers installed (tested with `nvidia-smi`)  
  已安裝 NVIDIA 顯示卡驅動，且可執行 `nvidia-smi`
- Internet access for downloading packages  
  可連上網路以安裝所需套件

---

## 🛠️ Installation / 安裝方式

### 🔹 Run via one-liner / 使用一行指令安裝

```bash
bash <(curl -fsSL https://raw.githubusercontent.com/h63016401/DockerGPU-Installer/main/install_gpu_docker.sh)
