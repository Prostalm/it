#!/bin/bash

# Змінні для підключення до бази даних
DB_USER="admin"
DB_PASSWORD="Pa55WD"
DB_NAME="flask_db"

# Шлях до папки для збереження резервних копій
BACKUP_DIR="/home/ec2-user/app/dump"

# Ім'я файлу резервної копії
BACKUP_FILE="$BACKUP_DIR/backup-$(date +\%Y\%m\%d-\%H\%M\%S).sql"

# Виконуємо mysqldump
mysqldump -u$DB_USER -p$DB_PASSWORD $DB_NAME > $BACKUP_FILE

# Архівація резервної копії
tar czvf $BACKUP_FILE.tar.gz $BACKUP_FILE

# Видаляємо оригінальний файл резервної копії
rm $BACKUP_FILE

# Ім'я віддаленого віджету S3
S3_BUCKET="s3sqldump"

# Кількість резервних копій для збереження
NUM_BACKUPS=7

# Копіюємо архів на S3
aws s3 cp $BACKUP_FILE.tar.gz s3://$S3_BUCKET/

# Видаляємо старі резервні копії на S3, залишаючи NUM_BACKUPS останніх
aws s3 ls s3://$S3_BUCKET/ | awk '{print $4}' | sort -r | tail -n +$(($NUM_BACKUPS+1)) | while read file; do aws s3 rm s3://$S3_BUCKET/$file; done
