# Fix Ctrl +left/right arrow keys (https://unix.stackexchange.com/questions/58870/ctrl-left-right-arrow-keys-issue)
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
