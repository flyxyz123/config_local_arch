#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
export MANPAGER="nvim +Man!"
export EDITOR=nvim
export INPUTRC="$XDG_CONFIG_HOME/readline/inputrc"
#export QT_QPA_PLATFORMTHEME=qt5ct
export QT_STYLE_OVERRIDE=kvantum
export PATH="$(find ~/.local/bin -type d -printf %p:)$PATH"
#export FZF_DEFAULT_COMMAND="fd --hidden --follow --exclude .git"
export FZF_DEFAULT_COMMAND="sudo find . -path '*/\.git' -prune -o -print"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="sudo find . -path '*/\.git' -prune -o -type d -print"
export SDCV_PAGER="less --quit-if-one-screen -RX"

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
