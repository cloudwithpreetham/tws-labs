mkdir -p scripts reports
printf '#!/bin/bash\nmkdir -p reports\nif pgrep -f api-service >/dev/null 2>&1; then echo "[INFO] api-service running" >> reports/watchdog.log; else echo "[WARN] api-service down, restarting" >> reports/watchdog.log; ./start_api.sh; echo "[INFO] api-service restored" >> reports/watchdog.log; fi\n' > scripts/watchdog.sh
chmod +x scripts/watchdog.sh
./scripts/watchdog.sh
