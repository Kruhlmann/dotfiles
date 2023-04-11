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

# Gems
if which ruby >/dev/null && which gem >/dev/null; then
    PATH="$(ruby -r rubygems -e 'puts Gem.user_dir')/bin:$PATH"
fi
# 2.7.0 non-RVM gems
PATH="/root/.gem/ruby/2.7.0/bin:$PATH"
PATH="$(go env GOPATH)/bin:$PATH"
