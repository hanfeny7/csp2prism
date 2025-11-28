# pat2prism Web UI 启动脚本

Write-Host "============================================" -ForegroundColor Cyan
Write-Host "   PAT2PRISM Web UI 启动脚本" -ForegroundColor Cyan
Write-Host "============================================" -ForegroundColor Cyan
Write-Host ""

# 检查依赖
Write-Host "📦 检查依赖..." -ForegroundColor Yellow
python -c "import flask" 2>$null
if ($LASTEXITCODE -ne 0) {
    Write-Host "⚠️  Flask未安装，正在安装..." -ForegroundColor Yellow
    pip install flask flask-cors -q
}

# 启动服务器
Set-Location $PSScriptRoot
Write-Host "🚀 启动Web服务器..." -ForegroundColor Green
Write-Host ""

python app.py
