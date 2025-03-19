#!/bin/bash

echo "Visify & dependencies install script"
echo "Made by syszelj9. Don't blatantly copy!!"
echo "Updating package list..."

if command -v dnf >/dev/null; then
    echo "Detected Fedora-based system"
    sudo dnf update -y
    sudo dnf install -y portaudio-devel SDL2-devel gcc make
elif command -v apt >/dev/null; then
    echo "Detected Ubuntu/Debian-based system"
    sudo apt update -y
    sudo apt install -y libportaudio2 libportaudiocpp0 portaudio19-dev libsdl2-dev gcc make
elif command -v pacman >/dev/null; then
    echo "Detected Arch-based system"
    sudo pacman -Sy --noconfirm portaudio sdl2 gcc make
else
    echo "Unsupported package manager. Please install dependencies manually."
    exit 1
fi

echo "Compiling Visify..."
gcc -o visify source.c -lportaudio -lSDL2 -lm

echo "Installation complete! You can now run the program with:"
echo "./visify"
