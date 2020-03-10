export PATH=$HOME/bin:/usr/local/bin:$PATH
export ZSH="$HOME/.config/.oh-my-zsh"

ZSH_THEME="avit"
ENABLE_CORRECTION="false"
COMPLETION_WAITING_DOTS="false"

# History file.
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory
unsetopt correct_all
unsetopt correct

source ~/.config/zsh/path.sh
source ~/.config/zsh/plugins.sh
source ~/.config/zsh/aliases.sh
source $ZSH/oh-my-zsh.sh

# Keyboard layout
setxkbmap -variant altgr-intl

# ENTR
if [ -f ~/.config/entr ]; then
    ~/.config/entr
fi

# NVM
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

# Thefuck
eval $(thefuck --alias)

# NO_PROXY Siemens
export NO_PROXY=".siemens.dk,$NOPROXY"
export DOTFILES="$HOME/doc/src/github.com/kruhlmann/dotfiles"
