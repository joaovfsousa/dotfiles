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

SPACESHIP_PROMPT_ASYNC=false
ZSH_THEME="spaceship"

source $ZSH/oh-my-zsh.sh

SPACESHIP_PROMPT_ORDER=(
  user          # Username section
  dir           # Current directory section
  host          # Hostname section
  git           # Git section (git_branch + git_status)
  hg            # Mercurial section (hg_branch  + hg_status)
  venv          # Python Venv section
  node          # Node.js section
  docker        # Docker section
  exec_time     # Execution time
  line_sep      # Line break
  jobs          # Background jobs indicator
  exit_code     # Exit code section
  char          # Prompt character
)

SPACESHIP_USER_SHOW=always
SPACESHIP_PROMPT_ADD_NEWLINE=false
SPACESHIP_CHAR_SYMBOL="➜"
SPACESHIP_CHAR_SUFFIX=""
SPACESHIP_VENV_PREFIX="via  "
SPACESHIP_VENV_SUFFIX=" "
SPACESHIP_VENV_COLOR="green"
SPACESHIP_EXEC_TIME_ELAPSED=1
SPACESHIP_USER_COLOR="cyan"
SPACESHIP_DIR_COLOR="green"
SPACESHIP_PROMPT_SEPARATE_LINE=true

plugins=(git node npm python pip command-not-found docker docker-compose extract git-prompt gitignore jsontools web-search asdf)

### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

### End of Zinit's installer chunk

alias editp="vim ~/.zshrc; szsh"
alias szsh="source ~/.zshrc; clear"
alias diskusage="df -H /"
alias tree="find . -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'"
alias cat='bat --paging=never'
alias d='docker'
alias dc='docker-compose'
alias g='git'
alias v='lvim'
alias v.='lvim .'
alias gg='lazygit -ucd ~/.config/lazygit'
alias dockly='docker run -it --rm -v /var/run/docker.sock:/var/run/docker.sock --name dockly lirantal/dockly'
alias p='cd $PROJECTS_DIR'
alias port='lsof -nP -iTCP -sTCP:LISTEN | grep'
alias k='kill -9'
alias omt='cd ~/Projects/Tevora/omt'

len(){
  place=cwd
  ls ${1:$place} | wc -l
}

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

autoload -U add-zsh-hook

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

load-nvmrc() {
  local node_version="$(nvm version)"
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$node_version" ]; then
      nvm use
    fi
  elif [ "$node_version" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}

add-zsh-hook chpwd load-nvmrc
load-nvmrc

export PATH="$PATH:`yarn global bin`"

source ~/.workzshrc

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
. "$HOME/.cargo/env"

[[ -s "/Users/joaovfsousa/.gvm/scripts/gvm" ]] && source "/Users/joaovfsousa/.gvm/scripts/gvm"

unsetopt PROMPT_SP
clear
