#!/bin/bash

# Проверка наличия репозитория Backports
if ! grep -q "deb http://deb.debian.org/debian $(lsb_release -cs)-backports main" /etc/apt/sources.list; then
    echo "deb http://deb.debian.org/debian $(lsb_release -cs)-backports main" | sudo tee -a /etc/apt/sources.list
fi

# Обновление пакетного менеджера
sudo apt update

# Установка Apache2
sudo apt install apache2 -y

# Запуск Apache2
sudo systemctl start apache2

# Установка Python
sudo apt install python -y

# Установка SSH-сервера
sudo apt install openssh-server -y

# Поднятие SSH-сервера
sudo systemctl start ssh