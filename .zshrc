# Function for Sourcing
function test_source {
    test -f "$1" && source "$1"
}

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
)

# Aliases
alias config="/usr/bin/git --git-dir=$HOME/code/dotfiles/ --work-tree=$HOME"
alias rm=trash
alias source_idf="test_source /opt/esp-idf/export.sh"

# Update Environment Variables
export EDITOR="nvim"
export PATH="$PATH:$(go env GOBIN):$(go env GOPATH)/bin"

# Activate Other Plugins
eval "$(starship init zsh)"
eval "$(zoxide init zsh)"

# Source Plugins
test_source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
test_source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Virtual Environments
test_source /usr/share/nvm/init-nvm.sh
