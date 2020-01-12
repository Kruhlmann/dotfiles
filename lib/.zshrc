export PATH=$HOME/bin:/usr/local/bin:$PATH
export ZSH="/home/ges/.oh-my-zsh"

ZSH_THEME="bira"
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="false"

# History file.
HISTFILE="~/.zsh_history"
HISTSIZE=10000
SAVEHIST=10000
setopt SHARE_HISTORY

source ~/.config/.zsh/plugins.sh
source ~/.config/.zsh/vars.sh
source ~/.config/.zsh/aliases.sh
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
