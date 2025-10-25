#!/usr/bin/env bash
set -Eeuo pipefail
cd /opt/erpnext_stack
SITE="${1:-$(grep '^ERPNEXT_SITE=' .env | cut -d= -f2)}"
if [[ -z "$SITE" ]]; then echo "Usage: $0 <site-name>"; exit 1; fi
docker compose exec -T backend bench --site "$SITE" backup
echo "Backups in: volumes/sites/${SITE}/private/backups"
