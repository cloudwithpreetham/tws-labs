#!/bin/bash
mkdir -p scripts var/log/app var/archive
echo "test-app-log" > var/log/app/app.log
echo "test-err-log" > var/log/app/error.log
echo "keepme" > var/log/app/readme.txt
