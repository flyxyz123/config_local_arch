#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls -lah --color=auto'
PS1='[\u@\h \W]\$ '

alias cfgc='/usr/bin/git --git-dir=$HOME/.mycfg_cross_platform/ --work-tree=$HOME'
alias cfgl='/usr/bin/git --git-dir=$HOME/.mycfg_local/ --work-tree=$HOME'

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"

export SSH_AUTH_SOCK="XDG_RUNTIME_DIR/ssh-agent.socket"

export MANPAGER='nvim +Man!'

# startx when login, should be put after environmental variables so .xinitrc can use $XDG_CONFIG_HOME 
if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
  exec startx
fi
