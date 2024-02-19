#!/usr/bin/env zsh

function len {
  place=cwd
  ls -a ${1:$place} | wc -l
}

function rnet {
  sudo ifconfig en0 down;
  sleep 3;
  sudo ifconfig en0 up;
}

function pk {
  local port=$1

  if [ -z $port ]; then
    echo "No port provided"
    return
  fi

  local pid=$(lsof -ti:${port})
  
  if [ -z $pid ]; then
    echo "No process found running in port $port"
    return
  fi

  kill -9 $pid 

  echo "Killed process running in port $port"
}
