SHELL=/bin/zsh

if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

if [ -x "$(command -v mpd)" ]; then
    mpd
fi

export MANPATH="/usr/local/man:$MANPATH"
export EDITOR="nvim"
export BROWSER="qutebrowser"
export FILE="ranger"
export NVM_DIR="$HOME/.nvm"
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'
export TERMINAL="termite"
export SHELL="/bin/zsh"
export TERM="xterm-color"
export TERMINAL="termite"
export NVM_DIR="$HOME/.nvm"
export I3CONFIG="~/.config/i3/config"
export GITLAB_TOKEN=$(cat $HOME/.repo-cache)
export GITLAB_ENDPOINT="https://mo-gitlab.siemens.dk/api/v4"
export GITLAB_REPO_CACHE="$HOME/.repo-cache"
export no_proxy=$no_proxy,siemens.dk
export NO_PROXY=$NO_PROXY,siemens.dk
export QT_QPA_PLATFORMTHEME=gtk3
