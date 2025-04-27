#!/usr/bin/env bash

# shellcheck disable=SC2016
declare -r DOTFILES_LOGO='
              ____        _    __ _ _
             |  _ \  ___ | |_ / _(_) | ___  ___
             | | | |/ _ \| __| |_| | |/ _ \/ __|
             | |_| | (_) | |_|  _| | |  __/\__ \
             |____/ \___/ \__|_| |_|_|\___||___/

  *** This is the setup script for my dotfiles on linux ***
             https://github.com/depp57/dotfiles
'

function download_chezmoi() {
  local os_name="$1"

  if [ "$os_name" = "ubuntu" ]; then
    # Install using a package manager
    snap install chezmoi --classic
  else
    # Install the binary in /usr/local/bin
    cd /usr/local && sh -c "$(curl -fsLS get.chezmoi.io)"
  fi
}

function run_chezmoi() {
  os_name=$(grep '^ID=' /etc/os-release | cut -d'=' -f2 | tr -d '"')

  download_chezmoi "$os_name"
  chezmoi init depp57 --apply
}


function main() {
  local machine_type="$1"

  if [ -z "$machine_type" ] || { [ "$machine_type" != "server" ] && [ "$machine_type" != "desktop" ]; }; then
    echo "Usage: $0 [server|desktop]"
    exit 1
  fi

  echo "$DOTFILES_LOGO"

   # Create ~/.config/chezmoi/chezmoi.toml dynamically
  mkdir -p "$HOME/.config/chezmoi"
  cat > "$HOME/.config/chezmoi/chezmoi.toml" <<EOF
[data]
machineType = "$machine_type"
EOF

  run_chezmoi
}

main "$@"
