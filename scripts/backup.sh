#!/bin/bash
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

DATE=$(date +%F)
tar -czf /tmp/logs-backup-$DATE.tar.gz /logs
aws s3 cp /tmp/logs-backup-$DATE.tar.gz s3://volume-data-backup/
rm /tmp/logs-backup-$DATE.tar.gz
echo "$(date) backup done" >> /logs/backup.log
