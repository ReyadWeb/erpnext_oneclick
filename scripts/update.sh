#!/usr/bin/env bash
set -Eeuo pipefail
cd /opt/erpnext_stack
docker compose pull
docker compose up -d
SITE="${1:-$(grep '^ERPNEXT_SITE=' .env | cut -d= -f2)}"
if [[ -n "$SITE" ]]; then
  docker compose exec -T backend bench --site "$SITE" migrate
fi
docker compose ps
