alias cya="exit"
# average windows user
alias cls="clear"

# same as OMZ's "gdca", but with one char less
# prime efficiency!
alias gdc="git diff --cached"

alias o="xdg-open"

# v because of "vim"
alias v="$EDITOR"
alias e="$EDITOR"
alias se="sudoedit"

alias hf="history | fzf"

function mktgz() {
  tar --exclude=".*" -czvf "$1.tar.gz" *
}

# for some reason, zsh-autosuggestions doesn't recognize this as an alias
function fuck() {
  sudo $(fc -ln -1)
}

# walmart ripgrep
function fif() {
  grep -Ir "$@" *
}

alias ls='ls --color=auto'
# human readable format - very handy
alias lh="ls -h"
alias grep="grep --color"

# like gss (git status short), but with the branch name included
alias gsb="git status -sb"

function mkbak() {
  for file in "$@"
  do
    cp "$file" "$file.bak"
  done
}

alias cdtmp='cd $(mktemp -d)'
