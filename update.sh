#!/bin/bash

set -o errexit
set -o nounset
set -o pipefail

cd "$(dirname "$(readlink -f "$BASH_SOURCE")")"

current="$(git ls-remote --tags https://github.com/syncthing/syncthing-inotify.git | grep -v '\^{}$' | grep -vE 'beta|rc' | cut -d/ -f3 | sort -V | tail -1)"
current="${current#v}"

sed -ri 's/^(ENV SYNCTHING_INOTIFY_VERSION) .*/\1 '"$current"'/' Dockerfile
sed -ri 's/^(SYNCTHING_INOTIFY_VERSION=).*/\1'"$current"'/' run.sh
git commit -am "update syncthing-inotify to latest (v$current)"
git tag "$current"
echo Now run: git push --tags
