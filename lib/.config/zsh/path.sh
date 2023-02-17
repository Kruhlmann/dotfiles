# Set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ]; then
	PATH="$HOME/bin:$PATH"
fi

# Set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ]; then
	PATH="$HOME/.local/bin:$PATH"
fi

# Include user scripts
if [ -d "$HOME/.scripts" ]; then
	PATH="$HOME/.scripts:$PATH"
fi

if [ -d "$HOME/.nimble/bin" ]; then
	PATH="$HOME/.nimble/bin:$PATH"
fi

export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
PATH="$PATH:$GOPATH:$GOBIN"

# Gems
if which ruby >/dev/null && which gem >/dev/null; then
	PATH="$(ruby -r rubygems -e 'puts Gem.user_dir')/bin:$PATH"
fi
# 2.7.0 non-RVM gems
PATH="/root/.gem/ruby/2.7.0/bin:$PATH"
PATH="$HOME/.cargo/bin:$PATH"
export PATH
