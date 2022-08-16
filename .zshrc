export ZSH="/home/entran/.oh-my-zsh"
ZSH_THEME=""
fpath+=$HOME/.oh-my-zsh/pure

plugins=(
	git
	zsh-syntax-highlighting
	zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

# Enable Pure Prompt
autoload -U promptinit; promptinit
prompt pure

# Source ROS
if [[ -f /opt/ros/humble/setup.zsh ]]; then
  source /opt/ros/humble/setup.zsh
fi

# Source NVM
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
