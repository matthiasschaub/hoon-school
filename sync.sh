#! /bin/bash
#
# continuously sync gen and lib dir to zod base desk
#
watch "rsync -zr gen/* $HOME/projects/zod/base/gen && rsync -zr lib/* $HOME/projects/zod/base/lib"
