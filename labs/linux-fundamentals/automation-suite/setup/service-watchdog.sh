#!/bin/bash
mkdir -p scripts reports bin
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
