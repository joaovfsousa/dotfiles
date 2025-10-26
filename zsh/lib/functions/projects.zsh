#!/usr/bin/env zsh
#
function run-script {
  local script_name=$1

  if [ -f yarn.lock ]; then
    yarn run "$script_name"
  elif [ -f pnpm-lock.yaml ]; then
    pnpm run "$script_name"
  elif [ -f bun.lock ]; then
    bun run "$script_name"
  else
    npm run "$script_name"
  fi
}

function run {
  if [ -f package.json ]; then
    if ! jq -e '.scripts' package.json >/dev/null; then
      echo "No scripts found in package.json"
      return
    fi

    local script=$(jq -r '.scripts' package.json | sed '1d;$d' | fzf --height 40% --reverse --query="$1")

    local script_name=$(echo $script | awk -F'"' '{print $2}')
    local script_value=$(echo $script | awk -F'"' '{print $4}')

    if [ -n "$script" ]; then
      echo "Running: $script_name"
      echo "Script: $script_value"
      run-script $script_name
    fi
  elif [[ -f Cargo.toml ]]; then
    cargo run
  else
    echo "No package.json or Cargo.toml found"
  fi
}

function s {
  if [[ $# -eq 1 ]]; then
      selected=$1
  else
    selected=$((find ~/projects $SESSIONIZER_PRIVATE_PATHS -mindepth 1 -maxdepth 1 -type d) | fzf)
  fi

  if [[ -z $selected ]]; then
      exit 0
  fi

  selected_name=$(basename "$selected" | tr . _)
  tmux_running=$(pgrep tmux)

  if [[ -z $TMUX ]] && [[ -z $tmux_running ]]; then
      tmux new-session -s $selected_name -c $selected
      exit 0
  fi

  if ! tmux has-session -t=$selected_name 2> /dev/null; then
      tmux new-session -ds $selected_name -c $selected
  fi

  tmux switch-client -t $selected_name
}
