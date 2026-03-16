#!/bin/bash
# Project Sekai Impact - Linux Build Script (SCPL)

echo "[ BUILD ] Compiling Assembly Math..."
# Compiling for 64-bit Linux
nasm -f elf64 ProjectSekaiImpact.asm -o ProjectSekaiImpact.o

echo "[ BUILD ] Linking Shared Object..."
ld -shared ProjectSekaiImpact.o -o ProjectSekaiImpact.so

if [ $? -eq 0 ]; then
    echo "[ INFO ] Build Successful. Launching Ursina..."
    python3 app.py
else
    echo "[ ERROR ] Assembly compilation failed."
    exit 1
fi