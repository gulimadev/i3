#!/bin/bash

# Atualize seu sistema e instale as dependências necessárias
sudo apt update
sudo apt install -y build-essential libxcb1-dev libxcb-keysyms1-dev libpango1.0-dev \
  libxcb-util0-dev xcb libxcb-icccm4-dev libyajl-dev libstartup-notification0-dev \
  libxcb-randr0-dev libev-dev libxcb-cursor-dev libxcb-xinerama0-dev libxcb-xkb-dev \
  libxkbcommon-dev libxkbcommon-x11-dev autoconf libxcb-xrm0 libxcb-xrm-dev automake \
  libxcb-shape0-dev libxcb-shape0 libxcb-xrm-dev ninja-build

# Clone o repositório do i3wm
git clone --recursive https://github.com/i3/i3.git
cd i3

# Crie um diretório build e navegue até ele
mkdir -p build && cd build

# Configurar e compilar usando o Ninja
meson ..
ninja

# Instalar o i3wm
sudo ninja install

# Reiniciar o gerenciador de janelas i3wm
i3-msg restart
