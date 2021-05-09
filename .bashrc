#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# default PS1
#PS1='[\u@\h \W]\$ '

# 1: bold, 91: bright red
# \e[m act like \e[0m, means reset so commands after it will not be colored 
# https://en.wikipedia.org/wiki/ANSI_escape_code#3-bit_and_4-bit
PS1='\e[1;91m[\u@\h \W]\$ \e[0m'

alias ls='ls --color=auto'
alias ll='ls -lah --color=auto'
alias cfgc='/usr/bin/git --git-dir=$HOME/.mycfg_cross_platform/ --work-tree=$HOME'
alias cfgl='/usr/bin/git --git-dir=$HOME/.mycfg_local/ --work-tree=$HOME'

eval "$(zoxide init bash)"
