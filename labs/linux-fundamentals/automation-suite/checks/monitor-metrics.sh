. "$LAB_LIB"

[ -f scripts/monitor.sh ] || fail "scripts/monitor.sh not found."
[ -x scripts/monitor.sh ] || fail "scripts/monitor.sh is not executable."

./scripts/monitor.sh -t 100 >/dev/null 2>&1
[ -f reports/health.log ] || fail "reports/health.log was not created."
if ! grep -Eq "\[OK\] Disk usage: [0-9]+%" reports/health.log; then
  fail "reports/health.log did not record '[OK] Disk usage: <percentage>%'"
fi

./scripts/monitor.sh -t 0 >/dev/null 2>&1
[ -f reports/alerts.log ] || fail "reports/alerts.log was not created."
if ! grep -Eq "\[ALERT\] Disk usage: [0-9]+%" reports/alerts.log; then
  fail "reports/alerts.log did not record '[ALERT] Disk usage: <percentage>%'"
fi
