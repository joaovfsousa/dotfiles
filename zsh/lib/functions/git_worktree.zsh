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

function _get_tree_name_from_branch {
  input=$1

  if [[ $input == *"/"* ]]; then
    before_slash=${input%%/*}

    after_slash=${input#*/}
    after_slash=${after_slash//[!0-9]/}

    input="${before_slash}${after_slash}"
  fi

  echo $input
}


function worktree_add { 
  new_branch_input=$1
  base_branch_input=$2

  if [[ $# -eq 0 ]]; then
    echo "Enter the name of the new branch: \c"
    IFS= read -r new_branch_input
  fi

  tree_name=$(_get_tree_name_from_branch $new_branch_input)

  if git rev-parse --verify --quiet "$new_branch_input"; then
    git worktree add $tree_name $new_branch_input
    return 0
  fi

  if [[ $# -lt 2 ]]; then
    base_branch_input=$(git branch --format='%(refname:short)' | fzf --header-first --header $'Select the base branch') 
  fi

  if [[ -z $base_branch_input ]]; then
    echo "Base branch not selected"
    return 1
  fi

  if ! git show-ref --quiet "$base_branch_input"; then
    echo "Branch '$base_branch_input' does not exists."
    return 1
  fi

  git worktree add -b $new_branch_input --checkout $tree_name $base_branch_input
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

