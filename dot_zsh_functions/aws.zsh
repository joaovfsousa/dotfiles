#!/usr/bin/env zsh
#
function awsp {
  local profile=$(aws configure list-profiles | fzf --height 40% --reverse --query="$1")

  if [ -z "$profile" ]; then
    return
  fi

  export AWS_PROFILE="$profile"
  echo "Switched to AWS profile: $AWS_PROFILE"
}
