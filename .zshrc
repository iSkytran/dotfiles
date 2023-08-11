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

# Ensure Correct Editor
export EDITOR="vim"

# Enable Pure Prompt
autoload -U promptinit; promptinit
prompt pure

# Source Plugins
source $ZSH/oh-my-zsh.sh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Python Virtual Environments
export WORKON_HOME=~/.virtualenvs
source /usr/bin/virtualenvwrapper_lazy.sh
source /usr/share/nvm/init-nvm.sh

