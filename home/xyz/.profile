#!/bin/sh

export XDG_CONFIG_HOME="$HOME/.config/"
export XDG_CACHE_HOME="$HOME/.cache/"
export XDG_DATA_HOME="$HOME/.local/share/"

. "$XDG_CONFIG_HOME/user-dirs.dirs"
export XDG_DESKTOP_DIR
export XDG_DOWNLOAD_DIR
export XDG_TEMPLATES_DIR
export XDG_PUBLICSHARE_DIR
export XDG_DOCUMENTS_DIR
export XDG_MUSIC_DIR
export XDG_PICTURES_DIR
export XDG_VIDEOS_DIR

PATH="$(find "$HOME/.local/bin" -type d -exec printf '%s:' '{}' \+)$PATH"
export PATH
export HISTSIZE=10000
export HISTFILESIZE=10000

export EDITOR=nvim
export BROWSER=firefox

export PAGER=less
# -X seems can keep the output if exit less?
# -F is useful when sdcv need user to manually select similar word, after selection if no -F less will not quit if one screen
# but other situation seems less use -F as default?
# steal from sdcv arch wiki
export LESS='-FRX'
export SDCV_PAGER="$PAGER"

# not posix
export MANPAGER='nvim -M +Man!'
export MANSECT='1p:1:n:l:8:3p:3:0p:0:2:5:4:9:6:7'

export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
export INPUTRC="$XDG_CONFIG_HOME/.inputrc"
#export QT_QPA_PLATFORMTHEME=qt5ct
export QT_QPA_PLATFORMTHEME=gtk2
#export QT_STYLE_OVERRIDE=kvantum
export SXHKD_SHELL=sh
# enable color for `tree` command, not forced
export CLICOLOR=1
# for pacdiff, without using aur neovim-drop-in or neovim-symlinks
export DIFFPROG='nvim -d'

# use sudo find for some files or dirs that has no permission ex: ~/.cache/paru/clone/
#export FZF_DEFAULT_COMMAND="fd --no-ignore --hidden --exclude .git"
#export FZF_CTRL_T_COMMAND="fd --absolute-path --no-ignore --hidden --exclude .git"
#export FZF_ALT_C_COMMAND="fd --no-ignore --hidden --type d --exclude .git"
export FZF_DEFAULT_COMMAND="sudo find . -mindepth 1 -path '*/\.git' -prune -o -print"
# https://askubuntu.com/questions/444551/get-absolute-path-of-files-using-find-command
# following two lines if use "" on the outermost, will not perfom expected, not sure why
export FZF_CTRL_T_COMMAND='sudo find "$PWD" -mindepth 1 -path "*/\.git" -prune -o -print'
#export FZF_CTRL_T_COMMAND='sudo find "$(pwd)" -path "*/\.git" -prune -o -print'
# ~+ is bashism
#export FZF_CTRL_T_COMMAND="sudo find ~+ -path '*/\.git' -prune -o -print"
export FZF_ALT_C_COMMAND="sudo find . -mindepth 1 -path '*/\.git' -prune -o -type d -print"

# for clipmenu
# set clipmenud to store clipboard only, don't store selection (primary)
#export CM_SELECTIONS="clipboard"
# X11, copy / close program / paste to another program, if 0 will paste nothing
#export CM_OWN_CLIPBOARD=1
#export CM_MAX_CLIPS=8

export SCR_WIDTH=1600
export SCR_HEIGHT=900

# GDK_SCALE and GDK_DPI_SCALE should be use at the same time
# more see bookmarks about dpi
# not sure if correct
#export GDK_SCALE=1.36
#export GDK_DPI_SCALE=0.73
# correct but not sure if fits me
#export GDK_SCALE=2
#export GDK_DPI_SCALE=0.5

# must source .bashrc after export _ZO_ECHO=1 and INPUTRC=..., else these two env will has no effect, don't know why
# here `. ~/.bashrc` same as `source ~/.bashrc`, see `source filename` in `man bash`, and `. file` in `man dash`
# `. file` is POSIX compliant, while `source file` is not
# https://github.com/koalaman/shellcheck/wiki/SC3046
#[[ -f ~/.bashrc ]] && . ~/.bashrc
[ -f "$HOME/.bashrc" ] && . "$HOME/.bashrc"

# startx when login, should be put after environmental variables for .xinitrc to use
if [ -z "$DISPLAY" ] && [ "$XDG_VTNR" -eq 1 ]; then
	exec startx
fi
