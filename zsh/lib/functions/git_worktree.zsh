function _list_worktrees {
  git worktree list | sed -E '/bare|\.repo/d'
}

function _select_worktree {
  query=" "
  if [[ $# -gt 0 ]]; then
    query=$1
  fi

  list_of_worktrees=$(_list_worktrees)

  echo $list_of_worktrees | fzf --height 40% --reverse --query $query
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

function worktree_switch {
  query=""
  if [[ $# -gt 0 ]]; then
    query=$1
  fi

  current=$(pwd | xargs basename)

  local worktree_path=$(_select_worktree $query | awk '{print $1}')

  builtin cd "$worktree_path"
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

function worktree_rm {
  selected_worktree=$(_select_worktree)

  selected_path=$(echo $selected_worktree | awk '{print $1}')

  selected_branch=$(echo $selected_worktree | awk '{print $3}' | sed 's/\[//;s/\]//')

  rm -r $selected_path

  git worktree prune

  git branch -q -D $selected_branch 

  echo "Delete tree $(basename $selected_path) of branch ${selected_branch}"
}

function worktree_prune {
  # Split the list into an array
  list_of_worktrees=("${(@f)$(_list_worktrees)}")

  repo_dir=$(pwd)

  for selected_worktree in "${list_of_worktrees[@]}"; do
    wt_path=$(echo $selected_worktree | awk '{print $1}')
    wt_branch=$(echo $selected_worktree | awk '{print $3}' | sed 's/\[//;s/\]//')

    if [[ "$wt_branch" == "master" || "$wt_branch" == "main" ]]; then
      echo -e "${C_GREEN}Skipping:${C_NC} main branch"
      continue
    fi
    
    cd "$wt_path" || continue

    # last_modified=$(stat -f "%m" $wt_path)
    last_modified=$(git log -1 --format=%ct)

    # Calculate the difference in days between now and the last modified date
    current_time=$(date +%s)
    diff_days=$(( (current_time - last_modified) / (60*60*24) ))

    # Check if the difference is less than 15 days
    if [ "$diff_days" -lt 15 ]; then
      cd "$repo_dir" || exit
      echo -e "${C_GREEN}Skipping $wt_branch - $wt_path:${C_NC} last commit $diff_days days ago"
      continue
    fi
  
    # Check for uncommitted changes
    if ! git diff-index --quiet HEAD --; then
      cd "$repo_dir" || exit
      echo -e "${C_YELLOW}Skipping $wt_branch - $wt_path:${C_NC} uncommitted changes"
      continue
    fi

    cd "$repo_dir" || exit

    rm -r $wt_path
    git worktree prune
    git branch -q -D $wt_branch 

    echo -e "${C_RED}Deleted $wt_branch - $wt_path:${C_NC} last commit $diff_days days ago"
  done
}

function worktree {
  case $1 in
    env|e)
      worktree_env
      ;;
    switch|s)
      worktree_switch ${@[2, -1]}
      ;;
    add|a)
      worktree_add ${@[2, -1]}
      ;;
    remove|rm|r)
      worktree_rm
      ;;
    prune|p)
      worktree_prune
      ;;
    *)
      echo "Invalid command"
      ;;
  esac
}

function wt {
    export GWT_NEW_DIR_FILE=~/.gwt/newdir

    gwtree "$@"

    if [ -f $GWT_NEW_DIR_FILE ]; then
      builtin cd "$(cat $GWT_NEW_DIR_FILE)"
      rm -f $GWT_NEW_DIR_FILE > /dev/null
    fi
}

