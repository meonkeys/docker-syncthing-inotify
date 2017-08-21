#!/bin/bash

set -o errexit
set -o nounset
set -o pipefail

if [ "$HOME" = '/home/user' ]; then
  echo >&2 'uh oh, HOME=/home/user'
  exit 1
fi

mkdir -p "$HOME/.config/syncthing"

SYNCTHING_INOTIFY_VERSION=0.8.7

set -x

docker run -d \
  --name syncthing-inotify \
  --restart always \
  -u "$(id -u):$(id -g)" \
  -v "$HOME:$HOME" \
  -v "$HOME/.config/syncthing:/home/user/.config/syncthing" \
  -v /etc:/etc \
  -v /mnt:/mnt \
  --net host \
  "meonkeys/syncthing-inotify:$SYNCTHING_INOTIFY_VERSION" "$@"

timeout 10s docker logs -f syncthing-inotify || true
