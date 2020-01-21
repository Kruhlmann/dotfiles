export MANPATH="/usr/local/man:$MANPATH"
export EDITOR="vim"
export BROWSER="firefox-developer-edition"
export NVM_DIR="$HOME/.nvm"
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'
export DOTFILES="$HOME/Documents/src/dotfiles/lib"
export TERMINAL="termite"
export SHELL="/bin/zsh"
export TERM=xterm-color
export NVM_DIR="$HOME/.nvm"
export I3CONFIG="~/.config/i3/config"
export GITLAB_TOKEN=$(cat $HOME/.repo-cache)
export GITLAB_ENDPOINT="https://mo-gitlab.siemens.dk/api/v4"
export GITLAB_REPO_CACHE=/home/ask/.repo-cache
. /usr/lib/siemens-proxy/siemens-proxy.sh && proxy_update
export no_proxy=$no_proxy,siemens.dk
export NO_PROXY=$NO_PROXY,siemens.dk
