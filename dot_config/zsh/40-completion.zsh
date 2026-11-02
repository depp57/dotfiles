# Completion scripts are pre-generated into ~/.local/share/zsh/completions
# Run `zcomp-refresh` after installing/upgrading a tool
fpath=(~/.local/share/zsh/completions ~/.docker/completions $fpath)

autoload -Uz compinit
() {
  local -a stale=(~/.zcompdump(N.mh+24))
  if (( $#stale )) || [[ ! -s ~/.zcompdump ]]; then compinit; else compinit -C; fi
}

# Tools that only ship bash-style completion
autoload -Uz bashcompinit && bashcompinit
(( $+commands[tofu] )) && complete -o nospace -C "${commands[tofu]}" tofu

zcomp-refresh() {
  local d=~/.local/share/zsh/completions
  mkdir -p "$d"
  (( $+commands[kubectl] ))  && kubectl completion zsh      > "$d/_kubectl"
  (( $+commands[talosctl] )) && talosctl completion zsh     > "$d/_talosctl"
  (( $+commands[helm] ))     && helm completion zsh         > "$d/_helm"
  (( $+commands[fnm] ))      && fnm completions --shell zsh > "$d/_fnm"
  rm -f ~/.zcompdump* && compinit && echo "completions refreshed"
}
