export PATH=$PATH:/opt/homebrew/bin

source ~/.git-flow-completion.zsh

HISTCONTROL=ignoreboth
HISTSIZE=1000
HISTFILESIZE=2000
export HISTCONTROL=ignoreboth
export HISTIGNORE="pwd:history:exit:ls:ll:ls -la:clear:cd:l:ll:l -l"
export HISTSIZE=10000

export EDITOR=vim

export PS1=$'\e[0;34m%n\e[0m$ '

alias l="ls -G"
alias ll="ls -laG"
alias home="cd ~"
