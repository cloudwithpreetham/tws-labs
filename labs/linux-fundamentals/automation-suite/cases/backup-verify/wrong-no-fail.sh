mkdir -p backups
printf '#!/bin/bash\ntar -czf backups/data.tar.gz data\nsha256sum backups/data.tar.gz > backups/data.tar.gz.sha256\nexit 0\n' > scripts/backup.sh
chmod +x scripts/backup.sh
./scripts/backup.sh
