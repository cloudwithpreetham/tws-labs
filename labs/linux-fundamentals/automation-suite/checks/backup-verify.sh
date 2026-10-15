. "$LAB_LIB"

[ -f scripts/backup.sh ] || fail "scripts/backup.sh not found."
[ -x scripts/backup.sh ] || fail "scripts/backup.sh is not executable."

if ./scripts/backup.sh __nonexistent_dir__ >/dev/null 2>&1; then
  fail "scripts/backup.sh must exit with error when source directory does not exist."
fi

[ -f backups/data.tar.gz ] || fail "backups/data.tar.gz does not exist."

hash_file=""
if [ -f backups/data.tar.gz.sha256 ]; then
  hash_file="backups/data.tar.gz.sha256"
elif [ -f backups/data.sha256 ]; then
  hash_file="backups/data.sha256"
else
  fail "Checksum file (backups/data.tar.gz.sha256 or backups/data.sha256) not found."
fi

if ! (cd "$(dirname "$hash_file")" && sha256sum -c "$(basename "$hash_file")" >/dev/null 2>&1); then
  fail "SHA-256 checksum verification failed."
fi
