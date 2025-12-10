#!/bin/bash
set -e

# 创建临时目录
mkdir -p temp

# 下载最新的 zashboard 发布版本
echo "Downloading latest zashboard release..."
curl -L -o dist.zip https://github.com/Zephyruso/zashboard/releases/latest/download/dist.zip

# 解压到临时目录
echo "Extracting files..."
unzip -o dist.zip -d temp/

# 删除 zip 文件
rm dist.zip

# 将所有文件移到根目录（如果是单个 dist 文件夹，则取出其内容）
if [ -d "temp/dist" ]; then
  echo "Moving files from temp/dist to root..."
  mv temp/dist/* .
else
  echo "Moving files from temp to root..."
  mv temp/* .
fi

# 删除临时目录
rm -rf temp

echo "Build completed successfully!"
