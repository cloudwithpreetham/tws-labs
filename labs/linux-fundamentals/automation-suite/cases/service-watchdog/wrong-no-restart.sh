mkdir -p reports
printf '#!/bin/bash\necho "[WARN] api-service down, restarting" >> reports/watchdog.log\n' > scripts/watchdog.sh
chmod +x scripts/watchdog.sh
./scripts/watchdog.sh
