#!/usr/bin/env bash
# 打包可部署的 deploy/ 資料夾：把 index-styleA.html 複製成 index.html + 帶上圖片
set -e
rm -rf deploy
mkdir -p deploy
cp index-styleA.html deploy/index.html
# styleB 並存版：同站不同網址（/styleB），共用同一份 images/
cp index-styleB.html deploy/styleB.html
cp -R images deploy/images
# 若有履歷 PDF 放在根目錄，一併帶上
[ -f Vivien-Hsu-CV.pdf ] && cp Vivien-Hsu-CV.pdf deploy/ || true
find deploy -name '.DS_Store' -delete 2>/dev/null || true
echo "✓ 已產出 deploy/（入口 index.html）"
