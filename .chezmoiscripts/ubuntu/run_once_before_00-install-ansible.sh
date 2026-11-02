#!/usr/bin/env bash
# Installs ansible

set -euo pipefail

if command -v ansible-playbook >/dev/null 2>&1; then
  exit 0
fi

sudo apt-get update
sudo apt-get install -y ansible-core
