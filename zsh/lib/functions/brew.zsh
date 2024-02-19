#!/usr/bin/env zsh
#
update_brewfile() {
    local current_dir=$(pwd)

    builtin cd '/Users/joaovfsousa/projects/dotfiles'
    brew bundle dump --force

    git add Brewfile
    git commit -m "brewfile: update" -q
    git push -q

    echo "Brewfile updated and pushed to dotfiles repo"

    builtin cd $current_dir
}

function brew {
  /opt/homebrew/bin/brew $@

  if ([ $1 = "install" ] || [ $1 = "uninstall" ] || [ $1 = "upgrade" ]); then
    update_brewfile
  fi
}
