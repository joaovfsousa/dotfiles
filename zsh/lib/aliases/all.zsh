alias v='nvim'
alias n='nvim'
alias editp="v ~/.zshrc; szsh"
alias szsh="source ~/.zshenv; source ~/.zshrc; clear"
alias diskusage="df -H /"
alias tree="find . -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'"
alias cat='bat --paging=never'
alias d='docker'
alias dc='docker-compose'
alias g='git'
alias hg='history | grep -i'
alias dd='oxker'
alias proj='cd $PROJECTS_DIR'
alias p='pnpm'
alias dot='proj; cd ~/projects/dotfiles'
alias port='lsof -nP -iTCP -sTCP:LISTEN | grep'
alias k='kill -9'

alias lg='lazygit -ucd ~/.config/lazygit'
alias gg='lazygit -ucd ~/.config/lazygit'
alias lc='last_commit'
alias lcm='last_commit_msg'
alias cb='git branch --sort=-committerdate | fzf --header "Checkout Recent Branch" --preview "git diff {1} --color=always" --pointer="" | xargs git checkout'

alias tm='tmux'
alias tma='tmux a'

alias img='wezterm imgcat'

alias cd='z'
alias la='ls -la'

alias gwt='worktree'

alias tspg='git clone --depth 1 git@github.com:joaovfsousa/ts-playground-template.git'

alias zj='zellij'
