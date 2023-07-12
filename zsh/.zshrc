export ZSH="/Users/joaovfsousa/.oh-my-zsh"
export ANDROID_HOME=~/Android/Sdk
export JAVA_HOME="/usr/lib/jvm/java-11-openjdk-amd64"
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:~/android-studio/bin
export PATH=$PATH:~/.local/bin
export QT_AUTO_SCREEN_SCALE_FACTOR=0 
export QT_SCREEN_SCALE_FACTORS="1;1.25"
export PROJECTS_DIR="/Users/joaovfsousa/Projects"
export LC_CTYPE=en_US.UTF-8
export XDG_CONFIG_HOME="$HOME/.config"
export CONFIG_DIR="$HOME/.config"

source ~/.zsh_aliases
source ~/.zsh_functions
source ~/.zsh_package_managers
source ~/.zsh_theme
source ~/.zsh_zinit

source $ZSH/oh-my-zsh.sh

[ -f ~/.workzshrc ] && source ~/.workzshrc

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

eval "$(zoxide init zsh)"

unsetopt PROMPT_SP
clear

