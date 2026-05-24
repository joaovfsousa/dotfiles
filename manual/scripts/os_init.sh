#!/usr/bin/env zsh

# exit immediately if brew is already in $PATH

case "$(uname -s)" in
Darwin)
  if ! command -v brew &>/dev/null; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  fi

  if ! command -v chezmoi &>/dev/null; then
    brew install chezmoi
  fi
  ;;
Linux)
  echo "TODO: Implement linux chezmoi instalation"
  exit 1
  ;;
*)
  echo "unsupported OS"
  exit 1
  ;;
esac

brew install chezmoi
