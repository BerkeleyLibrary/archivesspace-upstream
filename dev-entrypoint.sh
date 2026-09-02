#!/bin/bash
set -e

echo "==> Waiting 15 seconds for MySQL to fully initialize..."
sleep 15

echo "==> Running database migrations..."
./build/run db:migrate

echo "==> Starting application development servers..."
./build/run backend:devserver &
./build/run frontend:devserver &


echo "==> tailing logs..."
tail -f /dev/null 
