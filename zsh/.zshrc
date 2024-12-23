# Amazon Q pre block. Keep at the top of this file.
[[ -f "${HOME}/Library/Application Support/amazon-q/shell/zshrc.pre.zsh" ]] && builtin source "${HOME}/Library/Application Support/amazon-q/shell/zshrc.pre.zsh"

source ~/.zsh/.zsh_zimfw
source ~/.zsh/.zsh_theme
source ~/.zsh/.zsh_package_managers

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f ~/.pdot/zshrc ] && source ~/.pdot/zshrc

eval "$(zoxide init zsh)"

unsetopt PROMPT_SP
clear

# Amazon Q post block. Keep at the bottom of this file.
[[ -f "${HOME}/Library/Application Support/amazon-q/shell/zshrc.post.zsh" ]] && builtin source "${HOME}/Library/Application Support/amazon-q/shell/zshrc.post.zsh"
