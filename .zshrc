# Function for Sourcing
function test_source {
    test -f "$1" && source "$1"
}

export ZSH="/usr/share/oh-my-zsh"

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

# Update Environment Variables
export EDITOR="vim"
export PATH="$PATH:$(go env GOBIN):$(go env GOPATH)/bin"

# Activate Starship Prompt
eval "$(starship init zsh)"

# Source Plugins
test_source $ZSH/oh-my-zsh.sh
test_source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
test_source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Virtual Environments
export WORKON_HOME=~/.virtualenvs
test_source /usr/bin/virtualenvwrapper_lazy.sh
test_source /usr/share/nvm/init-nvm.sh
