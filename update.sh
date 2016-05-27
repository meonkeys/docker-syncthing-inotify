#!/bin/bash
set -e

cd "$(dirname "$(readlink -f "$BASH_SOURCE")")"

current="$(git ls-remote --tags https://github.com/syncthing/syncthing-inotify.git | grep -v '\^{}$' | grep -vE 'beta|rc' | cut -d/ -f3 | sort -V | tail -1)"
current="${current#v}"

set -x
sed -ri 's/^(ENV SYNCTHING_INOTIFY_VERSION) .*/\1 '"$current"'/' Dockerfile
docker build -t meonkeys/syncthing-inotify .
docker tag meonkeys/syncthing-inotify:latest "meonkeys/syncthing-inotify:v$current"
docker push meonkeys/syncthing-inotify:latest
docker push "meonkeys/syncthing-inotify:v$current"
