export ZSH="/home/entran/.oh-my-zsh"
ZSH_THEME=""
fpath+=$HOME/.oh-my-zsh/pure

plugins=(
	git
	zsh-syntax-highlighting
	zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

# Use vi mode
bindkey -v

# Enable Pure Prompt
autoload -U promptinit; promptinit
prompt pure

# Source ROS
if [[ -f /opt/ros/melodic/setup.zsh ]]; then
  source /opt/ros/melodic/setup.zsh
fi

# Source NVM
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# C Environmental Variables
CPATH=/usr/local/include
LIBRARY_PATH=/usr/local/lib
