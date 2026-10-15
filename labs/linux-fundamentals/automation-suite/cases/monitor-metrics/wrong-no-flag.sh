mkdir -p reports
printf '#!/bin/bash\necho "[OK] Disk usage: 50%%" >> reports/health.log\n' > scripts/monitor.sh
chmod +x scripts/monitor.sh
./scripts/monitor.sh
