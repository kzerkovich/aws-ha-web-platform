#!/bin/bash
set -e
cd "$(dirname "$0")/../moto"
docker compose up -d
echo "Waiting for MotoServer..."
sleep 5
aws --profile moto --endpoint-url=http://localhost:5000 s3 mb s3://terraform-state 2>/dev/null || true
echo "MotoServer is up: http://localhost:5000"
