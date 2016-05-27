# Syncthing inotify support

[![](https://imagelayers.io/badge/meonkeys/syncthing-inotify:latest.svg)](https://imagelayers.io/?images=meonkeys/syncthing-inotify:latest 'Get your own badge on imagelayers.io')

See [`Dockerfile`](https://github.com/meonkeys/docker-syncthing-inotify/blob/master/Dockerfile) and [example `run.sh` script](https://github.com/meonkeys/docker-syncthing-inotify/blob/master/run.sh) for usage.

This image is only useful in the context of a running instance of `syncthing`, so check out [`meonkeys/syncthing`](https://hub.docker.com/r/meonkeys/syncthing/) if you don't have `syncthing` already.

You probably also want to read ["Troubleshooting for folders with many files on Linux"](https://github.com/syncthing/syncthing-inotify#troubleshooting-for-folders-with-many-files-on-linux), especially `sudo sysctl -w fs.inotify.max_user_watches=204800` (as the temporary not-safe-from-reboot solution).

Forked from <https://github.com/tianon/dockerfiles/>.
