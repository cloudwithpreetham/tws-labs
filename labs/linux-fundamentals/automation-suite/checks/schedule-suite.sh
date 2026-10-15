. "$LAB_LIB"

[ -f crontab.txt ] || fail "crontab.txt not found."

entries=$(grep -v '^[[:space:]]*#' crontab.txt | grep -v '^[[:space:]]*$')

if ! echo "$entries" | grep -Eq '^\*/5[[:space:]]+\*[[:space:]]+\*[[:space:]]+\*[[:space:]]+\*[[:space:]]+.*watchdog\.sh.*>>.*2>&1'; then
  fail "crontab.txt must schedule watchdog.sh every 5 minutes (*/5 * * * *) with '>> ... 2>&1'."
fi

if ! echo "$entries" | grep -Eq '^0[[:space:]]+\*[[:space:]]+\*[[:space:]]+\*[[:space:]]+\*[[:space:]]+.*monitor\.sh.*>>.*2>&1'; then
  fail "crontab.txt must schedule monitor.sh every hour on the hour (0 * * * *) with '>> ... 2>&1'."
fi

if ! echo "$entries" | grep -Eq '^30[[:space:]]+2[[:space:]]+\*[[:space:]]+\*[[:space:]]+\*[[:space:]]+.*rotate\.sh.*>>.*2>&1'; then
  fail "crontab.txt must schedule rotate.sh daily at 02:30 (30 2 * * *) with '>> ... 2>&1'."
fi

if ! echo "$entries" | grep -Eq '^0[[:space:]]+3[[:space:]]+\*[[:space:]]+\*[[:space:]]+[07][[:space:]]+.*backup\.sh.*>>.*2>&1'; then
  fail "crontab.txt must schedule backup.sh every Sunday at 03:00 (0 3 * * 0) with '>> ... 2>&1'."
fi
