#!/bin/bash

set -euxo pipefail

[ -x ~/sv2v/bin/sv2v ] || git get -v -g -o ~/sv2v --rm-rf https://github.com/zachjs/sv2v
