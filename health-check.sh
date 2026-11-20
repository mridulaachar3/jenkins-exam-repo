#!/bin/bash
# Basic health check script (Jenkins Freestyle job runs this)
echo "=== Health Check v1 ==="
echo "Date : $(date)"
echo "Host : $(hostname)"
echo "Disk : $(df -h / | tail -1 | awk '{print $5}') used"

STATUS=0

if command -v python3 >/dev/null 2>&1; then
  echo "python3 : OK ($(python3 --version))"
else
  echo "python3 : MISSING"
  STATUS=1
fi

if [ -f app.py ]; then
  echo "app.py  : FOUND"
else
  echo "app.py  : MISSING"
  STATUS=1
fi

if [ $STATUS -eq 0 ]; then
  echo "RESULT: HEALTHY"
else
  echo "RESULT: UNHEALTHY"
fi
exit $STATUS
