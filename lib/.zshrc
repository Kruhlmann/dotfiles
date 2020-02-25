export PATH=$HOME/bin:/usr/local/bin:$PATH
export ZSH="$HOME/.config/.oh-my-zsh"

ZSH_THEME="oxide"
ENABLE_CORRECTION="true"
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
source ~/.config/zsh/vars.sh
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

# Entr
echo "$HOME/.config/i3/config" | entr -p i3-msg reload &
echo "$HOME/.config/polybar/config" | entr -p notify-send x a &
