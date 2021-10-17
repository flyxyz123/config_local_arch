#!/bin/sh

# here `. ~/.bashrc` same as `source ~/.bashrc`, see `source filename` in `man bash`, and `. file` in `man dash`
# `. file` is POSIX compliant, while `source file` is not
# https://github.com/koalaman/shellcheck/wiki/SC3046
#[[ -f ~/.bashrc ]] && . ~/.bashrc
[ -f "$HOME/.bashrc" ] && . "$HOME/.bashrc"

export XDG_CONFIG_HOME="$HOME/.config/"
export XDG_CACHE_HOME="$HOME/.cache/"
export XDG_DATA_HOME="$HOME/.local/share/"

. "$XDG_CONFIG_HOME/user-dirs.dirs"
export XDG_DESKTOP_DIR="$XDG_DESKTOP_DIR"
export XDG_DOWNLOAD_DIR="$XDG_DOWNLOAD_DIR"
export XDG_TEMPLATES_DIR="$XDG_TEMPLATES_DIR"
export XDG_PUBLICSHARE_DIR="$XDG_PUBLICSHARE_DIR"
export XDG_DOCUMENTS_DIR="$XDG_DOCUMENTS_DIR"
export XDG_MUSIC_DIR="$XDG_MUSIC_DIR"
export XDG_PICTURES_DIR="$XDG_PICTURES_DIR"
export XDG_VIDEOS_DIR="$XDG_VIDEOS_DIR"

export PATH="$(find "$HOME/.local/bin" -type d -printf %p:)$PATH"
export HISTSIZE=7000
export HISTFILESIZE=7000

export MANPAGER='nvim +Man!'
export EDITOR=nvim
export BROWSER=firefox

export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
export INPUTRC="$XDG_CONFIG_HOME/readline/inputrc"
#export QT_QPA_PLATFORMTHEME=qt5ct
export QT_QPA_PLATFORMTHEME=gtk2
#export QT_STYLE_OVERRIDE=kvantum
export SDCV_PAGER='less --quit-if-one-screen -RX'
export SXHKD_SHELL=sh
export _ZO_ECHO=1

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

# startx when login, should be put after environmental variables for .xinitrc to use
if [ -z "$DISPLAY" ] && [ "$XDG_VTNR" -eq 1 ]; then
	exec startx
fi
