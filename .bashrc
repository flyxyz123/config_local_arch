#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

source /usr/share/fzf/completion.bash
source /usr/share/fzf/key-bindings.bash

# default PS1
#PS1='[\u@\h \W]\$ '

# 0: not bold, 91: bright red
# \e[m act like \e[0m, means reset so commands after it will not be colored 
# https://en.wikipedia.org/wiki/ANSI_escape_code#3-bit_and_4-bit
# need \[ and \] around color codes so bash ignore color codes when calculating line wraps
PS1="\[\e[0;91m\][\u@\h \W]\$ \[\e[0m\]"

alias ls="ls --color=auto"
alias sdcv="sdcv --color"
alias grep="grep --color=auto"
alias diff="diff --color=auto"

alias ll="ls -lAh --color=auto --group-directories-first"
alias cfgc="/usr/bin/git --git-dir=$HOME/.mycfg_cross_platform/ --work-tree=$HOME"
alias cfgl="/usr/bin/git --git-dir=$HOME/.mycfg_local/ --work-tree=$HOME"
#alias mlfm="mpv --loop-file=inf --video=no"
#alias mlpm="mpv --loop-playlist=inf --video=no"

alias v="$EDITOR"
alias g=git

eval "$(zoxide init bash)"
