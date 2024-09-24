# Local env variables must be defined in env.fish
set -gx FISH_CONFIG $DOTFILES/fish
set -gx EDITOR nano

# Source
source $DOTFILES/env.fish
source $FISH_CONFIG/functions/execute.fish
execute source $FISH_CONFIG/plugins
execute source $FISH_CONFIG/functions

# Paths
fish_add_path /opt/homebrew/sbin
fish_add_path /opt/homebrew/bin
fish_add_path $HOME/.cargo/bin
fish_add_path $HOME/.go/bin
fish_add_path /usr/local/go/bin
fish_add_path $HOME/.local/bin
fish_add_path $HOME/.local/share/nvim/mason/bin
fish_add_path $DOTFILES/scripts

# Alias
alias cg="chat"
alias bat="batcat"
alias b __cd_back_to
alias dot="cd $DOTFILES"

# Autorun Tmux
if status is-interactive
    and not set -q TMUX
    exec tmux -f $DOTFILES/tmux/tmux.conf
end

if type -q pyenv
    pyenv init - | source
    status --is-interactive; and source (pyenv virtualenv-init - | psub)
end