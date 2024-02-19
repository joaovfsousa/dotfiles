#!/usr/bin/env zsh
#
function desk_to_pos {
  curl -X POST http://192.168.0.151:80/api/devices/lights/$1/state/ON -d bri
}
