#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"

export PATH="$(find ~/.local/bin -type d -printf %p:)$PATH"
export HISTSIZE=5000
export HISTFILESIZE=5000

export MANPAGER='nvim +Man!'
export EDITOR=nvim

export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
export INPUTRC="$XDG_CONFIG_HOME/readline/inputrc"
#export QT_QPA_PLATFORMTHEME=qt5ct
export QT_STYLE_OVERRIDE=kvantum
export SDCV_PAGER="less --quit-if-one-screen -RX"
export SXHKD_SHELL=sh

#export FZF_DEFAULT_COMMAND="fd --no-ignore --hidden --exclude .git"
#export FZF_CTRL_T_COMMAND="fd --absolute-path --no-ignore --hidden --exclude .git"
#export FZF_ALT_C_COMMAND="fd --no-ignore --hidden --type d --exclude .git"
export FZF_DEFAULT_COMMAND="sudo find . -path '*/\.git' -prune -o -print"
# https://askubuntu.com/questions/444551/get-absolute-path-of-files-using-find-command
# following two lines if use "" on the outermost, will not perfom expected, not sure why
export FZF_CTRL_T_COMMAND='sudo find $PWD -path "*/\.git" -prune -o -print'
#export FZF_CTRL_T_COMMAND='sudo find $(pwd) -path "*/\.git" -prune -o -print'
# ~+ is bashism
#export FZF_CTRL_T_COMMAND="sudo find ~+ -path '*/\.git' -prune -o -print"
export FZF_ALT_C_COMMAND="sudo find . -path '*/\.git' -prune -o -type d -print"

# for clipmenu
# set clipmenud to store clipboard only, don't store selection (primary)
#export CM_SELECTIONS="clipboard"
# X11, copy / close program / paste to another program, if 0 will paste nothing
#export CM_OWN_CLIPBOARD=1
#export CM_MAX_CLIPS=8

# startx when login, should be put after environmental variables for .xinitrc to use
if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
	exec startx
fi
