export ZSH="$HOME/.config/.oh-my-zsh"

source ~/.config/zsh/path.sh
source ~/.config/zsh/plugins.sh
source ~/.config/zsh/aliases.sh
source ~/.config/zsh/binds.sh
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh
source $ZSH/oh-my-zsh.sh

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

# GPG
# export GPG_TTY=$(tty)
# export SSH_AUTH_SOCK="/run/user/$(id -u)/gnupg/S.gpg-agent.ssh"
#
