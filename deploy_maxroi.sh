#!/usr/bin/env bash
set -euo pipefail
PROJECT=velonx12-local
TAG=$(date +%s)
echo "🏗 Building images..."
docker build -t $PROJECT/core:$TAG core/
docker build -t $PROJECT/levelmap:$TAG services/levelmapper/
docker build -t $PROJECT/ui:$TAG -f packages/dashboard/Dockerfile packages/dashboard || true
for AG in orb; do
  docker build -t $PROJECT/$AG:$TAG agents/$AG/ || true
done
echo "🚀 Launching stack with docker-compose..."
cat <<'COMPOSE' > docker-compose.yml
version: '3'
services:
  core:
    image: $PROJECT/core:$TAG
    ports: ['3001:3001']
  levelmap:
    image: $PROJECT/levelmap:$TAG
    ports: ['4000:4000']
  ui:
    image: $PROJECT/ui:$TAG
    ports: ['3100:3100']
COMPOSE
docker compose up -d
echo "✅ VELONX12 online -> http://localhost:3100"
