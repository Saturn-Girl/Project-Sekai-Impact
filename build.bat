@echo off
title Project Sekai Impact Build Tool
echo [ BUILD ] Compiling Assembly for Windows...

:: Compiling to Win64 object format
nasm -f win64 ProjectSekaiImpact.asm -o ProjectSekaiImpact.obj

echo [ BUILD ] Creating DLL...
:: Using gcc (MinGW) to link the DLL
gcc -shared ProjectSekaiImpact.obj -o ProjectSekaiImpact.dll

if %errorlevel% equ 0 (
    echo [ INFO ] DLL Created. Launching App...
    python app.py
) else (
    echo [ ERROR ] Build failed. Check your Assembly syntax.
    pause
)