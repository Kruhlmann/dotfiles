function repo {
    filter_params=""
    if [ -n "$1" ]; then
        filter_params="-q $1"
    fi
    repo_path=$(find ~/doc/* -name .git -type d -prune -maxdepth 5 | sed 's/\/.git$//' | sort | fzf $filter_params --select-1)
    cd $repo_path
}

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.config/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"
ENABLE_CORRECTION="false"
COMPLETION_WAITING_DOTS="false"

# History file.
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory
unsetopt correct_all
unsetopt correct

# setxkbmap -variant altgr-intl

source ~/.config/zsh/path.sh
source ~/.config/zsh/plugins.sh
source ~/.config/zsh/aliases.sh
source ~/.config/zsh/binds.sh
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh
source $ZSH/oh-my-zsh.sh

# GPG
# export GPG_TTY=$(tty)
# export SSH_AUTH_SOCK="/run/user/$(id -u)/gnupg/S.gpg-agent.ssh"

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source /usr/share/nvm/init-nvm.sh

# pnpm
export PNPM_HOME="/home/ges/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end

# opam configuration
[[ ! -r /home/ges/.opam/opam-init/init.zsh ]] || source /home/ges/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null
