mkdir -p scripts var/archive
printf '#!/bin/bash\nset -e\ndir="${1:-var/log/app}"\nmkdir -p var/archive\ntar -czf var/archive/logs.tar.gz -C "$dir" $(cd "$dir" && ls *.log 2>/dev/null)\nfor f in "$dir"/*.log; do [ -f "$f" ] && : > "$f"; done\n' > scripts/rotate.sh
chmod +x scripts/rotate.sh
./scripts/rotate.sh
