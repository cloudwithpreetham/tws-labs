mkdir -p scripts reports
printf '#!/bin/bash\nthresh=80\nwhile getopts "t:" opt; do case "$opt" in t) thresh="$OPTARG" ;; esac; done\nmkdir -p reports\nu=$(df / | awk '\''NR==2 {gsub("%%",""); print $5}'\'')\nif [ "$u" -gt "$thresh" ]; then echo "[ALERT] Disk usage: ${u}%%" >> reports/alerts.log; else echo "[OK] Disk usage: ${u}%%" >> reports/health.log; fi\n' > scripts/monitor.sh
chmod +x scripts/monitor.sh
./scripts/monitor.sh
