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

