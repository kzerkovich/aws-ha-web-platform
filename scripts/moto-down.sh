#!/bin/bash
set -e
cd "$(dirname "$0")/../moto"
docker compose down
echo "MotoServer stopped"
