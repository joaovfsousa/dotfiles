# Softwares
alias v='nvim'
alias n='nvim'
# alias c='cursor --user-data-dir $HOME/.appdata/cursor/personal'
# alias cr='cursor --user-data-dir $HOME/.appdata/cursor/personal -r .'
# alias cw='cursor --user-data-dir $HOME/.appdata/cursor/work'
# alias cwr='cursor --user-data-dir $HOME/.appdata/cursor/work -r .'
alias c='cursor'
alias cr='cursor -r .'
alias vs='open $1 -a "Visual Studio Code"'
alias ca='cursor-agent'
alias cas='cursor-agent --model sonnet-4.5-thinking'
alias cag='cursor-agent --model gpt-5'

alias p='pnpm'

alias zj='zellij'

alias k='kubectl'
alias d='docker'
alias dc='docker-compose'
alias dd='oxker'

alias g='git'
alias lg='lazygit -ucd ~/.config/lazygit'
alias gg='lazygit -ucd ~/.config/lazygit'

alias lc='last_commit'
alias lcm='last_commit_msg'
alias cb='git branch --sort=-committerdate | fzf --header "Checkout Recent Branch" --preview "git diff {1} --color=always" --pointer="" | xargs git checkout'

alias cd='z'
alias la='ls -la'

alias o='ollama'

# Misc

alias editp="v ~/.zshrc; szsh"
alias szsh="source ~/.zshenv; source ~/.zshrc; clear"
alias diskusage="df -H /"
alias tree="find . -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'"
alias cat='bat --paging=never'
alias hg='history | grep -i'
alias proj='cd $PROJECTS_DIR'
alias dot='cd ~/projects/dotfiles'
alias work='cd $PROJECTS_DIR/work'

alias port='lsof -nP -iTCP -sTCP:LISTEN | grep'

alias tspg='git clone --depth 1 git@github.com:joaovfsousa/ts-playground-template.git'

alias emulator='~/Library/Android/sdk/emulator/emulator'
