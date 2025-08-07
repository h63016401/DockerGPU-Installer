# DockerGPU-Installer

# 🚀 GPU Docker Setup

A one-click setup script for enabling NVIDIA GPU support in Docker on Ubuntu.  
This project helps developers and researchers quickly configure GPU-based Docker environments using NVIDIA Container Toolkit.

---

## 🧩 Features

- ✅ Installs Docker Engine and Docker Compose (plugin version)
- ✅ Enables NVIDIA GPU support via `nvidia-docker2`
- ✅ Tests CUDA availability inside containers
- ✅ Adds current user to the `docker` group

---

## 📦 Requirements

- Ubuntu 18.04 / 20.04 / 22.04
- NVIDIA GPU with drivers installed (tested with `nvidia-smi`)
- Internet access for downloading packages

---

## 🛠️ Installation

### 🔹 Run via one-liner

```bash
bash <(curl -fsSL https://raw.githubusercontent.com/h63016401/DockerGPU-Installer/main/install_gpu_docker.sh)
