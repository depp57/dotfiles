# Prompt - https://starship.rs
(( $+commands[starship] )) && eval "$(starship init zsh)"

# fnm (Node version manager) - https://github.com/schniz/fnm#zsh
(( $+commands[fnm] )) && eval "$(fnm env --use-on-cd --version-file-strategy=recursive --shell zsh)"
