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
export HISTSIZE=15000
export HISTFILESIZE=15000

export EDITOR=nvim
export BROWSER=firefox
# -X seems can keep the output if exit less?
# -F is useful when sdcv need user to manually select similar word, after selection if no -F less will not quit if one screen
# but other situation seems less use -F as default?
# steal from sdcv arch wiki
export PAGER='less -FRX'

export SDCV_PAGER="$PAGER"
export SDCV_HISTSIZE=10000
# CALCURSE_PAGER less can't use -F, else ? and > hotkey will only blink the text
#export CALCURSE_PAGER=less
# not posix
export MANPAGER='nvim -M +Man!'
export MANSECT='1p:1:n:l:8:3p:3:0p:0:2:5:4:9:6:7'
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
export INPUTRC="$XDG_CONFIG_HOME/.inputrc"
# Thanks to https://github.com/trialuser02/qt6gtk2/pull/5
# Now qt5 with aur qt5-styleplugins and qt6 with aur qt6gtk2 makes qt5 and qt6 appearance universal!
export QT_QPA_PLATFORMTHEME=gtk2
#export QT_STYLE_OVERRIDE=kvantum
#export SXHKD_SHELL=sh
# enable color for `tree` command, not forced
export CLICOLOR=1
# for pacdiff, without using aur neovim-drop-in or neovim-symlinks
export DIFFPROG='nvim -d'
export MAKEFLAGS="-j$(nproc --all)"
export DOTREMINDERS="$HOME/programs/reminders/.reminders"
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
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

export SCR_WIDTH=1920
export SCR_HEIGHT=1080

# for clipmenu
# set clipmenud to store clipboard only, don't store selection (primary)
#export CM_SELECTIONS="clipboard"
# X11, copy / close program / paste to another program, if 0 will paste nothing
#export CM_OWN_CLIPBOARD=1
#export CM_MAX_CLIPS=8

# GDK_SCALE and GDK_DPI_SCALE should be use at the same time
# GDK_SCALE is recommended to be an integer
# GDK_DPI_SCALE=1/GDK_SCALE
# more see bookmarks about dpi
#export GDK_SCALE=2
#export GDK_DPI_SCALE=0.5

playerctld daemon

# must source .bashrc after export _ZO_ECHO=1 and INPUTRC=..., else these two env will has no effect, don't know why
# here `. ~/.bashrc` same as `source ~/.bashrc`, see `source filename` in `man bash`, and `. file` in `man dash`
# `. file` is POSIX compliant, while `source file` is not
# https://github.com/koalaman/shellcheck/wiki/SC3046
#[[ -f ~/.bashrc ]] && . ~/.bashrc
[ -f "$HOME/.bashrc" ] && . "$HOME/.bashrc"

# startx when login, should be put after environmental variables for .xinitrc to use
# use `[ "$XDG_VTNR" ]` to avoid "-bash: [: : integer expression expected" warning/error message, when `sudo su - xyz` or ssh into a remote server, not sure if best practice or not
if [ -z "$DISPLAY" ] && [ "$XDG_VTNR" ] && [ "$XDG_VTNR" -eq 1 ]; then
	exec startx
fi
