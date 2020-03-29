plugins=(
    catimg
    colored-man-pages
    docker
    extract
    gem
    gitfast
    npm
    pip
    ssh-agent
    sudo
    zsh-autosuggestions
    zsh-completions
    zsh-syntax-highlighting
)

zstyle :omz:plugins:ssh-agent agent-forwarding on
zstyle :omz:plugins:ssh-agent identities personal 
zstyle :omz:plugins:ssh-agent identities work 
zstyle :omz:plugins:ssh-agent lifetime
