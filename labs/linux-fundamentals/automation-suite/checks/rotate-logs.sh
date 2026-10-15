. "$LAB_LIB"

[ -f scripts/rotate.sh ] || fail "scripts/rotate.sh not found."
[ -x scripts/rotate.sh ] || fail "scripts/rotate.sh is not executable."

[ -f var/archive/logs.tar.gz ] || fail "var/archive/logs.tar.gz does not exist."

if ! tar -tzf var/archive/logs.tar.gz 2>/dev/null | grep -q "app.log"; then
  fail "var/archive/logs.tar.gz does not contain app.log."
fi

size_app=$(stat -c %s var/log/app/app.log 2>/dev/null || stat -f %z var/log/app/app.log 2>/dev/null || echo 1)
[ "$size_app" -eq 0 ] || fail "var/log/app/app.log was not truncated to 0 bytes (size is $size_app)."

size_err=$(stat -c %s var/log/app/error.log 2>/dev/null || stat -f %z var/log/app/error.log 2>/dev/null || echo 1)
[ "$size_err" -eq 0 ] || fail "var/log/app/error.log was not truncated to 0 bytes (size is $size_err)."

size_readme=$(stat -c %s var/log/app/readme.txt 2>/dev/null || stat -f %z var/log/app/readme.txt 2>/dev/null || echo 0)
[ "$size_readme" -gt 0 ] || fail "var/log/app/readme.txt should not be truncated."
