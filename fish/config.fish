set -U fish_greeting ""

if status is-interactive
    # Commands to run in interactive sessions can go here
    starship init fish | source
end

# Y Function for yazi
function y
    set tmp (mktemp -t "yazi-cwd.XXXXXX")
    yazi $argv --cwd-file="$tmp"
    if set cwd (command cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
        builtin cd -- "$cwd"
    end
    rm -f -- "$tmp"
end

# Aliases
alias c='clear'
alias cls='clear'
alias v='nvim'
alias lg='lazygit'
alias mc='micro'
alias cat='bat'

alias gr='go run'
alias gb='go build'

# List Directory
alias l='eza -lh  --icons=auto' # long list
alias ls='eza -1   --icons=auto' # short list
alias ll='eza -lha --icons=auto --sort=name --group-directories-first' # long list all
alias ld='eza -lhD --icons=auto' # long list dirs
alias lt='eza --icons=auto --tree' # list folder as tree

alias sb='nvim ~/Documents/GitHub/Second-Brain/ROOT.md'

alias vconf='nvim ~/dotkeep/nvim/'

# Handy change dir shortcuts
abbr .. 'cd ..'
abbr ... 'cd ../..'
abbr .3 'cd ../../..'
abbr .4 'cd ../../../..'
abbr .5 'cd ../../../../..'

# Always mkdir a path (this doesn't inhibit functionality to make a single dir)
abbr mkdir 'mkdir -p'

zoxide init fish | source

set -x GOPATH $HOME/go
set -x PATH $PATH $GOPATH/bin
export RUSTC_WRAPPER=sccache

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

# nim
set -ga fish_user_paths /Users/rivethorn/.nimble/bin

set --export PATH ~/.local/bin/ $PATH
set --export HOMEBREW_NO_ENV_HINTS 1
set --export HAXE_STD_PATH /opt/homebrew/lib/haxe/std
