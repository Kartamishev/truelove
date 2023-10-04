#!/bin/bash

# ��������� ���������� ��� ���������� ��������� �����
backup_dir="/path/to/backup"
archive_dir="/path/to/archive"

# �������� ���������� ��� ��������� �����, ���� ��� �� ����������
mkdir -p $backup_dir

# ����������� ���������� /home
cp -r /home $backup_dir

# ����������� ���������������� ������ SSH
cp /etc/ssh/sshd_config $backup_dir
cp /etc/ssh/ssh_config $backup_dir

# ����������� ���������������� ������ RDP
cp /etc/xrdp/xrdp.ini $backup_dir

# ����������� ���������������� ������ FTP
cp /etc/vsftpd.conf $backup_dir

# ����������� ���������� /var/log
cp -r /var/log $backup_dir

# �������� ���������� ��� �������������, ���� ��� �� ����������
mkdir -p $archive_dir

# �������� ����� ������ � ������� �����
backup_file="backup_$(date +%Y-%m-%d_%H-%M-%S).tar.gz"

# ������������� ��������� �����
tar -czf $archive_dir/$backup_file $backup_dir

# �������� ��������� ���������� � ���������� �������
rm -rf $backup_dir

# ����� ��������� �� �������� ���������� ���������� �����������
echo "��������� ����������� ��������� �������"