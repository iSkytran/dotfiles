# Enable Powerlevel10k Instant Prompt
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Function for Sourcing
function test_source {
    test -f "$1" && source "$1"
}

export ZSH="$HOME/.oh-my-zsh"
export ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
    archlinux
    copyfile
    copypath
    cp
    docker
    docker-compose
    extract
    git
    git-auto-fetch
    man
    pip
    python
    rsync
    sudo
    tmux
    vscode
    zsh-autosuggestions
    zsh-syntax-highlighting
)

# Aliases
alias config="/usr/bin/git --git-dir=$HOME/code/dotfiles/ --work-tree=$HOME"
alias rm=trash
alias source_idf="test_source /opt/esp-idf/export.sh"
alias nv="nvim"
alias lv="NVIM_APPNAME=lazyvim nvim"

# Update Environment Variables
export EDITOR="nvim"
export PATH="$PATH:$(go env GOBIN):$(go env GOPATH)/bin"

# Source Scripts
test_source $ZSH/oh-my-zsh.sh
test_source /usr/share/nvm/init-nvm.sh
test_source ~/.p10k.zsh
