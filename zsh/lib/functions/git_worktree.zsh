function worktree_switch {
  if git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
    current=$(pwd | xargs basename)
    list_of_worktrees=$(git worktree list | sed -E '/bare|\.repo/d')

    local worktree_path=$(echo $list_of_worktrees | fzf --height 40% --reverse | awk '{print $1}')

    builtin cd "$worktree_path"
  else
    echo "Not inside a worktree repo."
  fi
}

function worktree_env {
  local parent_dir=$(dirname "$PWD")

  if [ -f "$parent_dir/.env" ]; then
      ln -s "$parent_dir/.env" .env
      echo "Symbolic link created to .env file in the current directory."
  else
      echo "No .env file found in the parent directory."
  fi 
}

function worktree_add {
  echo $@
}

function worktree {
  case $1 in
    env|e)
      worktree_env
      ;;
    switch|s)
      worktree_switch
      ;;
    add|a)
      worktree_add ${@[2, -1]}
      ;;
    *)
      echo "Invalid command"
      ;;
  esac
}

