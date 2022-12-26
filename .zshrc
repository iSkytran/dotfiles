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

# Dotfile Alias
alias config='/usr/bin/git --git-dir=$HOME/code/dotfiles/ --work-tree=$HOME'

# Enable Pure Prompt
autoload -U promptinit; promptinit
prompt pure

source $ZSH/oh-my-zsh.sh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

