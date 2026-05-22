#!/usr/bin/env zsh

# Move to bin and git aliases
postpush() {
  zellij action dump-screen /tmp/zellij-dump
  cat /tmp/zellij-dump | $HOME/.bin/get-url | pbcopy 
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
