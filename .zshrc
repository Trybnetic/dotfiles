export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="agnoster"

plugins=(
  git
)

source $ZSH/oh-my-zsh.sh
source .aliases

# User configuration

export LANG=en_US.UTF-8

# Start neofetch at the beginning of a new shell
neofetch

# added by Miniconda3 installer
export PATH="/home/trybnetic/miniconda3/bin:$PATH"
