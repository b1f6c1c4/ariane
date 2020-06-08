#!/bin/bash

set -euxo pipefail

[ -x ~/sv2v/bin/sv2v ] || git get -v -g -o ~/sv2v --rm-rf https://github.com/zachjs/sv2v

git -C ~/sv2v fetch origin master:FETCH_HEAD

if [ "$(git rev-parse HEAD)" = "$(git rev-parse FETCH_HEAD)" ]; then
    git -C ~/sv2v reset --hard FETCH_HEAD
    make -C ~/sv2v
fi
