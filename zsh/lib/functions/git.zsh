#!/usr/bin/env zsh

postpush() {
  local originUrl=$(git remote get-url origin)

  if [[ $originUrl =~ bitbucket || $originUrl =~ github ]]; then
    # if tmux info &> /dev/null; then 
    #   tmux capture-pane -S -900 -p | $HOME/.bin/get-url | pbcopy
    # fi
    zcat | $HOME/.bin/get-url | pbcopy 
  else
    echo "Push was successfull but could not copy url to clipboard"
  fi
}

function commit_msg {
  git log --format=%B -n 1 $1
}

function last_commit {
  if git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
    hash=$(g log -1 --oneline | awk '{print $1}')
    echo $hash | pbcopy && echo "Commit $hash copied to clipboard"
  else
    echo "Not a git repository"
    return 1
  fi
}

function last_commit_msg {
  if git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
    commit_msg=$(git log -1 --pretty=format:%B | sed -e 's/^/ /')

    echo $commit_msg | pbcopy && echo "Commit message copied to clipboard"
  else
    echo "Not a git repository"
    return 1
  fi
}

function gps {
  git push;
  postpush;
}

function gpsf {
  git push --force-with-lease;
  postpush;
}
