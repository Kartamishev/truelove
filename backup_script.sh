#!/bin/bash

# Установка директории для сохранения резервных копий
backup_dir="/path/to/backup"
archive_dir="/path/to/archive"

# Создание директории для резервных копий, если она не существует
mkdir -p $backup_dir

# Копирование директории /home
cp -r /home $backup_dir

# Копирование конфигурационных файлов SSH
cp /etc/ssh/sshd_config $backup_dir
cp /etc/ssh/ssh_config $backup_dir

# Копирование конфигурационных файлов RDP
cp /etc/xrdp/xrdp.ini $backup_dir

# Копирование конфигурационных файлов FTP
cp /etc/vsftpd.conf $backup_dir

# Копирование директории /var/log
cp -r /var/log $backup_dir

# Создание директории для архивирования, если она не существует
mkdir -p $archive_dir

# Создание имени архива с текущей датой
backup_file="backup_$(date +%Y-%m-%d_%H-%M-%S).tar.gz"

# Архивирование резервных копий
tar -czf $archive_dir/$backup_file $backup_dir

# Удаление временной директории с резервными копиями
rm -rf $backup_dir

# Вывод сообщения об успешном завершении резервного копирования
echo "Резервное копирование завершено успешно"