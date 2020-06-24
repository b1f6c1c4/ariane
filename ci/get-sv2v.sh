#!/bin/bash

set -euxo pipefail

if [ ! -x ~/sv2v/bin/sv2v ]; then
    git get -v -g -o ~/sv2v --rm-rf https://github.com/zachjs/sv2v
    make -C ~/sv2v
fi

git -C ~/sv2v fetch --force origin master:FETCH_HEAD

if [ ! "$(git -C ~/sv2v rev-parse HEAD)" = "$(git -C ~/sv2v rev-parse FETCH_HEAD)" ]; then
    git -C ~/sv2v reset --hard FETCH_HEAD
    make -C ~/sv2v
fi
