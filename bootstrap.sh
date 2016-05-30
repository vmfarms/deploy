#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

ansible-galaxy install -r requirements.yml -p roles
