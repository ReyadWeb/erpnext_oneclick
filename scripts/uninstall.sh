#!/usr/bin/env bash
set -Eeuo pipefail
cd /opt/erpnext_stack || { echo "/opt/erpnext_stack not found"; exit 1; }
read -rp "This will stop containers. Also delete volumes? (y/N): " DEL
docker compose down
if [[ "${DEL,,}" == "y" || "${DEL,,}" == "yes" ]]; then
  rm -rf volumes/*
  echo "Volumes deleted."
fi
