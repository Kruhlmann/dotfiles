plugins=(
    catimg
    docker
    extract
    gem
    gitfast
    last-working-dir
    npm
    pip
    ssh-agent
    sudo
    zsh-syntax-highlighting
)

zstyle :omz:plugins:ssh-agent agent-forwarding on
zstyle :omz:plugins:ssh-agent identities t420
zstyle :omz:plugins:ssh-agent lifetime
