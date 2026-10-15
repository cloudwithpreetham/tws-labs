printf '#!/bin/bash\ndir="${1:-var/log/app}"\nmkdir -p var/archive\ntar -czf var/archive/logs.tar.gz -C "$dir" $(cd "$dir" && ls *.log)\ntruncate -s 0 "$dir"/*.log\n' > scripts/rotate.sh
chmod +x scripts/rotate.sh
./scripts/rotate.sh
