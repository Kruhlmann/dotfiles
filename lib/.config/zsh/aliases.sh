#!/usr/bin/env zsh

alias c='commit'
alias cd..='cd ..'
alias chgrp='chgrp --preserve-root'
alias chmod='chmod --preserve-root'
alias chown='chown --preserve-root'
alias l='ls -CF'
alias la='ls -la'
alias ll='ls -alF'
alias ping='ping -c 5'
alias ports='netstat -tulanp'
alias untar='tar -zxvf'
alias v='vim'
alias wget='wget -c'
alias yt="youtube-dl --add-metadata -i -c -w -o '$HOME/Videos/youtube/%(title)s.%(ext)s' -f best"
alias yta="youtube-dl --add-metadata -i -c -w -o '$HOME/Music/%(title)s.%(ext)s' -f best -x --audio-format mp3"
alias ytc="youtube-dl -f best -ciw -o '%(title)s.%(ext)s' -v"
alias play="mpg123"
alias wow="~/.local/share/lutris/runners/wine/lutris-4.16-x86_64/bin/wine64 ~/Games/world-of-warcraft/drive_c/Program\ Files\ \(x86\)/World\ of\ Warcraft/_classic_/Wow.exe"
alias pacman="sudo pacman"
alias psqlopen="sudo su postgres -c psql"
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
alias vim="nvim"
alias e="nvim"
alias lock="betterlockscreen -l \"blur\""
alias tsm="transmission-remote"
alias please="sudo"
alias gg="lazygit"
alias fif="grep \"$0\" . -R"
alias br="br --sizes"
alias wttr="curl wttr.in"
alias myip="curl ifconfig.co"
alias imgc="xclip -selection clipboard -t image/png -o > "
alias sysu="systemctl --user"
alias sysr="systemctl --user"
alias gst="git status --short"
alias commit="emoji_commit_selector"
alias recommit="sh /tmp/last-commit"
alias dockerm="docker ps -a | awk '{ print $1 }' | xargs docker rm"
alias pickie="gpick -o --no-newline -s -p | xclip -selection clipboard"

alias makevenv=". ~/.scripts/makevenv"
alias repos=". ~/.scripts/repos"
