. "$LAB_LIB"

[ -f scripts/watchdog.sh ] || fail "scripts/watchdog.sh not found."
[ -x scripts/watchdog.sh ] || fail "scripts/watchdog.sh is not executable."
[ -f reports/watchdog.log ] || fail "reports/watchdog.log not found. Run ./scripts/watchdog.sh."

if ! grep -q "\[INFO\] api-service" reports/watchdog.log && ! grep -q "\[WARN\] api-service" reports/watchdog.log; then
  fail "reports/watchdog.log has no supervisor entries."
fi

if ! pgrep -f api-service >/dev/null 2>&1 && ! pgrep api-service >/dev/null 2>&1; then
  fail "api-service is not running."
fi
