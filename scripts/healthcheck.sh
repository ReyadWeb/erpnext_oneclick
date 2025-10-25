#!/usr/bin/env bash
set -Eeuo pipefail
echo "Docker:"; docker --version || true
echo "Compose:"; docker compose version || true
echo "Containers:"; docker ps --format 'table {{.Names}}\t{{.Status}}'
echo "Traefik routes (expect 80/443 open):"; ss -tulpen | grep -E ':(80|443)\s' || true
echo "MariaDB health:"; docker compose ps mariadb || true
