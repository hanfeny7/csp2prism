#!/bin/bash
# pat2prism Web UI 启动脚本

echo "============================================"
echo "   PAT2PRISM Web UI 启动脚本"
echo "============================================"
echo ""

# 检查依赖
echo "📦 检查依赖..."
python3 -c "import flask" 2>/dev/null || {
    echo "⚠️  Flask未安装，正在安装..."
    pip install flask flask-cors -q
}

# 启动服务器
cd "$(dirname "$0")"
echo "🚀 启动Web服务器..."
echo ""

python3 app.py
