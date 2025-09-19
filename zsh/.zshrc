source ~/.zsh/.zsh_zimfw
source ~/.zsh/.zsh_theme
source ~/.zsh/.zsh_package_managers

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f ~/.pdot/zshrc ] && source ~/.pdot/zshrc

eval "$(zoxide init zsh)"

unsetopt PROMPT_SP

export GPG_TTY=$(tty)

clear
eval "$(~/.local/bin/mise activate zsh)"
