#!/bin/bash
set -e

mkdir -p scripts var/log/app var/archive data backups reports bin

# Seed log files
echo "2026-10-15 01:00:00 app started" > var/log/app/app.log
echo "2026-10-15 01:01:00 user query" >> var/log/app/app.log
echo "2026-10-15 01:02:00 timeout 504" > var/log/app/error.log
echo "keepme" > var/log/app/readme.txt

# Seed data files
echo "id,name,role" > data/users.csv
echo "1,alice,admin" >> data/users.csv
echo '{"mode":"production"}' > data/config.json

# Seed api-service daemon
cat << 'EOF' > bin/api-service
#!/bin/bash
while true; do sleep 1; done
EOF
chmod +x bin/api-service

cat << 'EOF' > start_api.sh
#!/bin/bash
if pgrep -f api-service >/dev/null 2>&1 || pgrep api-service >/dev/null 2>&1; then
  exit 0
fi
./bin/api-service >/dev/null 2>&1 &
echo $! > api.pid
disown
EOF
chmod +x start_api.sh
