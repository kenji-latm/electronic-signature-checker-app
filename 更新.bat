@echo off
chcp 65001 >nul
cd /d "%~dp0"
set NODE_USE_SYSTEM_CA=1
set NODE_OPTIONS=--use-system-ca
echo ============================================
echo  トウシテナ  データ更新
echo ============================================
echo.
echo 法務省ページから最新データを取得中...
node scraper\update-from-moj.js
if errorlevel 1 goto err
echo.
echo 完了しました。
echo 更新先: app\moj-signature-data.js
echo.
pause
exit /b 0

:err
echo.
echo ------------------------------------------------
echo  エラーが発生しました。
echo  Node.js とインターネット接続を確認してください。
echo ------------------------------------------------
echo.
pause
exit /b 1
