#!/usr/bin/env zsh

# Move to bin and git aliases
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

function last_commit_msg {
  if git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
    commit_msg=$(git log -1 --pretty=format:%B | sed -e 's/^/ /')

    echo $commit_msg
  else
    echo "Not a git repository"
    exit 1
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
