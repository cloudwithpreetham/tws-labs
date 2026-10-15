mkdir -p reports
printf '#!/bin/bash\nif pidof api-service >/dev/null 2>&1; then echo "[INFO] api-service running" >> reports/watchdog.log; else echo "[WARN] api-service down, restarting" >> reports/watchdog.log; ./start_api.sh; echo "[INFO] api-service restored" >> reports/watchdog.log; fi\n' > scripts/watchdog.sh
chmod +x scripts/watchdog.sh
./scripts/watchdog.sh
