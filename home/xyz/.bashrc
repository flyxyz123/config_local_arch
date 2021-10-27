#!/bin/sh

# $- meaning see https://stackoverflow.com/questions/42757236/what-does-mean-in-bash
# If not running interactively, don't do anything
#[[ $- != *i* ]] && return
# https://github.com/westscz/.dotfiles/blob/master/system/bashrc
case $- in
	*i*) ;;
	*) return;;
esac

. /usr/share/fzf/completion.bash
. /usr/share/fzf/key-bindings.bash

# default PS1
#PS1='[\u@\h \W]\$ '

# depreciated
# 0: not bold, 91: bright red
# \e[m act like \e[0m, means reset so commands after it will not be colored 
# https://en.wikipedia.org/wiki/ANSI_escape_code#3-bit_and_4-bit
# need \[ and \] around color codes so bash ignore color codes when calculating line wraps?
# https://www.cyberciti.biz/faq/bash-shell-change-the-color-of-my-shell-prompt-under-linux-or-unix/#:~:text=you%20also%20need%20to%20put%20%5C%5B%20and%20%5C%5D%20around%20any%20color%20codes%20so%20that%20bash%20does%20not%20take%20them%20into%20account%20when%20calculating%20line%20wraps.
#PS1='\[\e[0;91m\][\u@\h \W]\$ \[\e[0m\]'
# \033 can be used for dash printf, but \e can't? not sure why
#PS1='\[\033[0;91m\][\u@\h \W]\$ \[\033[0m\]'

# tput is better for different terminals? 
# setaf and sgr0 see `man terminfo`
PS1="$(tput setaf 1)[\u@\h \W]\$ $(tput sgr0)"

# https://github.com/LukeSmithxyz/voidrice/blob/master/.config/shell/aliasrc
for cmd in iotop nethogs hardcode-fixer ventoy; do
	alias $cmd="sudo $cmd"
done
unset cmd

alias absolutely-proprietary='absolutely-proprietary -f'
alias alsamixer='alsamixer -V all'
alias diff='diff --color=auto'
alias grep='grep --color=auto'
alias ls='ls --color=auto'
alias radeontop='radeontop -c'
alias rm='rm -I'
alias sdcv='sdcv --color'
alias tree='tree -a'

# /dev/ttyACM0 can be in config file, or as environmantal variable, see /usr/share/doc/adafruit-ampy/README.md
alias ap='sudo ampy -p /dev/ttyACM0'
alias c='cfg'
alias g=git
alias ll='ls -lAh --color=auto --group-directories-first'
alias s='sudo ' # https://askubuntu.com/a/22043
alias se='sudo -E '
alias spd='speedtest --no-upload; librespeed-cli --no-upload'
alias sv='sudoedit'
alias tp='sudo tio /dev/ttyACM0'
alias v='$EDITOR'
alias vc='$EDITOR "$XDG_DOCUMENTS_DIR/notes/computer/cli_notes.md"'
alias vq='$EDITOR "$XDG_DOCUMENTS_DIR/notes/others/questions_ideas_tips.md"'
alias vrc='$EDITOR +e\ \$MYVIMRC'
alias wtr='curl v2.wttr.in'

eval "$(zoxide init bash)"
