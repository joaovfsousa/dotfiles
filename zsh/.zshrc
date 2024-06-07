# Nix
if [ -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh' ]; then
  . '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
fi
# End Nix
#
source ~/.zsh/.zsh_zimfw
source ~/.zsh/.zsh_theme
source ~/.zsh/.zsh_package_managers

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f ~/.pdot/zshrc ] && source ~/.pdot/zshrc

eval "$(zoxide init zsh)"

unsetopt PROMPT_SP
clear
