#!/usr/bin/env zsh
#
da() { docker exec -it $1 /bin/bash }

dl() { docker logs -n 100 --follow $1 }

function dll {
  if [[ "$1" == "-l" ]]; then
    if [ -z $container_id ]; then 
      echo 'No container id found.'
      return
    else
      dl $container_id
      return
    fi
  fi

  local docker_container=$(docker ps --format "{{json . }}")

  if [[ "$1" == "-a" ]]; then
    docker_container=$(docker ps -a --format "{{json . }}")
  fi

  local selected_container=$(echo $docker_container | 
    jq -r '.Names + " | " + .Status + " | " + .Ports + " | " + .Image  + ", ID: " + .ID' |
    fzf )

  container_id=$(echo "$selected_container" | awk -F 'ID: ' '{print $2}')

  dl $container_id
}
