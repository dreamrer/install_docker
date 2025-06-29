#!/bin/bash
# 更新系统
sudo apt update && sudo apt upgrade -y

# 安装必要的依赖项
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common

# 添加 Docker 官方 GPG 密钥
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -

# 添加 Docker 官方仓库
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"

# 更新 APT 包索引
sudo apt update

# 安装 Docker CE
sudo apt install -y docker-ce

# 启动 Docker 服务并设置为开机启动
sudo systemctl start docker
sudo systemctl enable docker

# 添加当前用户到 docker 组（可选）
sudo usermod -aG docker $USER

# 检查 Docker 版本
docker --version

# 显示 Docker 服务状态
sudo systemctl status docker

echo "Docker 安装完成！请重新登录或运行 'newgrp docker' 来使用 Docker 命令。"
