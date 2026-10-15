mkdir -p scripts backups
printf '#!/bin/bash\nsrc="${1:-data}"\ndest="${2:-backups/data.tar.gz}"\nif [ ! -d "$src" ]; then echo "Error: missing $src" >&2; exit 1; fi\nmkdir -p "$(dirname "$dest")"\ntar -czf "$dest" "$src"\n(cd "$(dirname "$dest")" && sha256sum "$(basename "$dest")" > "$(basename "$dest").sha256")\n' > scripts/backup.sh
chmod +x scripts/backup.sh
./scripts/backup.sh
