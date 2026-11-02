# Completion scripts are pre-generated into ~/.local/share/zsh/completions
fpath=(~/.local/share/zsh/completions ~/.docker/completions $fpath)

autoload -Uz compinit
() {
  local -a stale=(~/.zcompdump(N.mh+24))
  if (( $#stale )) || [[ ! -s ~/.zcompdump ]]; then compinit; else compinit -C; fi
}

# Tools that only ship bash-style completion
autoload -Uz bashcompinit && bashcompinit
(( $+commands[tofu] )) && complete -o nospace -C "${commands[tofu]}" tofu
