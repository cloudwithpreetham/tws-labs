#!/bin/bash
mkdir -p data backups scripts
echo "id,name,role" > data/users.csv
echo "1,alice,admin" >> data/users.csv
echo '{"mode":"production"}' > data/config.json
