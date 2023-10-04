#!/bin/bash

# �������� ������� ����������� Backports
if ! grep -q "deb http://deb.debian.org/debian $(lsb_release -cs)-backports main" /etc/apt/sources.list; then
    echo "deb http://deb.debian.org/debian $(lsb_release -cs)-backports main" | sudo tee -a /etc/apt/sources.list
fi

# ���������� ��������� ���������
sudo apt update

# ��������� Apache2
sudo apt install apache2 -y

# ������ Apache2
sudo systemctl start apache2

# ��������� Python
sudo apt install python -y

# ��������� SSH-�������
sudo apt install openssh-server -y

# �������� SSH-�������
sudo systemctl start ssh