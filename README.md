# erpnext_oneclick

One-command **production** installer for **ERPNext (Frappe) v15** on Ubuntu 22.04/24.04 using **Docker + Traefik + Let’s Encrypt**.

## Features
- Single prompt for domain, passwords, and (optional) SMTP
- Docker & Compose v2 installation
- Traefik reverse proxy with automatic HTTPS
- MariaDB + 3× Redis roles
- Bench one-shot job that creates the site, installs ERPNext, enables scheduler
- UFW firewall: allow 80/443, rate-limit SSH, deny MySQL from WAN
- Logs to `/var/log/erpnext_oneclick.log`

## Quick start
```bash
# Upload and run on a fresh Ubuntu 22.04/24.04 server
chmod +x install.sh
sudo ./install.sh
```

When done: open `https://<YOUR_DOMAIN>` and log in as **Administrator** with the password you provided.

## Helpers
- `scripts/backup.sh` – manual site backup
- `scripts/update.sh` – image pull + migrate
- `scripts/uninstall.sh` – stop stack and (optionally) delete volumes
- `scripts/healthcheck.sh` – quick sanity checks

## Notes
- Ensure your FQDN A record points to this server **before** running the installer.
- Default MariaDB is **not** exposed publicly (port 3306 denied by UFW).
- To add another site later, set `ERPNEXT_SITE` and re-run the `site-creator` service:

```bash
cd /opt/erpnext_stack
export ERPNEXT_SITE=newsite.example.com
docker compose run --rm site-creator
```

## License
MIT
