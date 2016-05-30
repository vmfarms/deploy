#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

ansible-playbook -u deploy \
                 -i hosts \
                 -e "ansistrano_release_version=$(date -u +%Y%m%d%H%M%SZ)" \
                 deploy.yml
