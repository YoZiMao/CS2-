@echo off
chcp 65001 >nul
cd /d "%~dp0"

:: ================= 配置区域 =================
set SERVER_PATH=F:\server_cs2
set APP_ID=730
:: ===========================================

echo ========================================
echo 正在启动 SteamCMD 更新 CS2 服务器...
echo 目标安装目录：%SERVER_PATH%
echo App ID: %APP_ID%
echo ========================================
echo.

:: 检查 steamcmd.exe 是否存在
if not exist "steamcmd.exe" (
    echo [错误] 未找到 steamcmd.exe！
    echo 请确保 steamcmd.exe 与此脚本在同一目录下。
    echo 下载地址：https://steamcdn-a.akamaihd.net/client/installer/steamcmd.zip
    pause
    exit /b 1
)

:: 执行更新 (添加了 validate 以验证文件完整性)
steamcmd.exe +force_install_dir "%SERVER_PATH%" +login anonymous +app_update %APP_ID% validate +quit

:: 检查执行结果
if %errorlevel% neq 0 (
    echo.
    echo [警告] SteamCMD 执行完毕，但检测到错误 (错误代码：%errorlevel%)
    echo 请检查网络连接或磁盘空间。
) else (
    echo.
    echo [成功] 服务器文件更新/验证完成！
)

echo.
pause
