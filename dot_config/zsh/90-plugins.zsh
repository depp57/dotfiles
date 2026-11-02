# Installed by the ansible playbook. zsh-syntax-highlighting must be sourced last.
() {
  local p
  for p in ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh \
           ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh; do
    [[ -r $p ]] && source "$p"
  done
}
