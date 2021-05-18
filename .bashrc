#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# default PS1
#PS1='[\u@\h \W]\$ '

# 0: not bold, 91: bright red
# \e[m act like \e[0m, means reset so commands after it will not be colored 
# https://en.wikipedia.org/wiki/ANSI_escape_code#3-bit_and_4-bit
# need \[ and \] around color codes so bash ignore color codes when calculating line wraps
PS1='\[\e[0;91m\][\u@\h \W]\$ \[\e[0m\]'

alias ls='ls --color=auto'
alias ll='ls -lah --color=auto'
alias cfgc='/usr/bin/git --git-dir=$HOME/.mycfg_cross_platform/ --work-tree=$HOME'
alias cfgl='/usr/bin/git --git-dir=$HOME/.mycfg_local/ --work-tree=$HOME'
alias datec='TZ=Asia/Shanghai date "+%a %m/%d/%Y %H:%M:%S %Z"'

eval "$(zoxide init bash)"
