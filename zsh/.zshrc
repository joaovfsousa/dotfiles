# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.pre.zsh"


source ~/.zsh/.zsh_vars
source ~/.zsh/.zsh_package_managers
source ~/.zsh/.zsh_theme
source ~/.zsh/.zsh_aliases
source ~/.zsh/.zsh_functions

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

eval "$(zoxide init zsh)"

unsetopt PROMPT_SP
clear

# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/zshrc.post.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.post.zsh"
# fig install --input-method to make it work with wezterm
