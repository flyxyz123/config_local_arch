#
# ~/.bashrc
#

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

# 0: not bold, 91: bright red
# \e[m act like \e[0m, means reset so commands after it will not be colored 
# https://en.wikipedia.org/wiki/ANSI_escape_code#3-bit_and_4-bit
# need \[ and \] around color codes so bash ignore color codes when calculating line wraps
PS1="\[\e[0;91m\][\u@\h \W]\$ \[\e[0m\]"

alias \
absolutely-proprietary="absolutely-proprietary -f" \
alsamixer="alsamixer -V all" \
diff="diff --color=auto" \
grep="grep --color=auto" \
ls="ls --color=auto" \
rm="rm -vI" \
sdcv="sdcv --color" \
g=git \
ll="ls -lAh --color=auto --group-directories-first" \
v='$EDITOR' \
vq='$EDITOR "$XDG_DOCUMENTS_DIR/notes/others/questions_ideas_tips.md"' \
vc='$EDITOR "$XDG_DOCUMENTS_DIR/notes/computer/command-line_notes.md"'

eval "$(zoxide init bash)"
