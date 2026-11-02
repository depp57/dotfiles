#!/usr/bin/env bash
# Regenerates zsh completion scripts for the tools installed on this machine.
# Runs after every `chezmoi apply`.

set -euo pipefail

dir="$HOME/.local/share/zsh/completions"
mkdir -p "$dir"

gen() { # gen <tool> <command...>
  local tool="$1"; shift
  if command -v "$tool" >/dev/null 2>&1; then
    "$@" > "$dir/_$tool.tmp" 2>/dev/null && mv "$dir/_$tool.tmp" "$dir/_$tool" || rm -f "$dir/_$tool.tmp"
  else
    rm -f "$dir/_$tool"
  fi
}

gen kubectl  kubectl completion zsh
gen helm     helm completion zsh
gen talosctl talosctl completion zsh
gen k9s      k9s completion zsh
gen fnm      fnm completions --shell zsh
gen docker   docker completion zsh

# Force compinit to rebuild its cache on the next shell start
rm -f "$HOME"/.zcompdump*
