mkdir -p backups
printf '#!/bin/bash\nset -e\n[ ! -d "${1:-data}" ] && exit 1\nmkdir -p backups\ntar -czf backups/data.tar.gz data\n(cd backups && sha256sum data.tar.gz > data.sha256)\n' > scripts/backup.sh
chmod +x scripts/backup.sh
./scripts/backup.sh
