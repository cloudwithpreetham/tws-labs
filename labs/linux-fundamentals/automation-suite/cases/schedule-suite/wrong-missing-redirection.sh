printf '*/5 * * * * scripts/watchdog.sh\n0 * * * * scripts/monitor.sh\n30 2 * * * scripts/rotate.sh\n0 3 * * 0 scripts/backup.sh\n' > crontab.txt
