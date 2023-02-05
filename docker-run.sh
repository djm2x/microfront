#!/bin/bash

# find the last tagged commit and assume it was the last release
# cd projects && git diff --name-only $COMMIT_ID | awk -F'/' 'NF!=1{print $2}' | sort -u

# git diff --name-only HEAD $COMMIT |grep shell

# TAG=$(git describe --abbrev=0)
COMMIT=$(git rev-parse HEAD)
# COMMIT='67caa105b3b286ff221a06d386ef2fb1498cd00f'

echo $COMMIT

# if git diff $LAST_COMMIT HEAD --name-only|grep folder1; then
#   echo 'ok'
# fi;
# git log | head -n 1

# git diff --name-only HEAD

# git log -n 2 --pretty=format:"%h" | tail -n 1

git diff HEAD@{1} $COMMIT --name-only | grep remote-app

# git diff HEAD $COMMIT  --name-only|grep remote-app

# CHANGED=$(git diff --name-only HEAD $COMMIT $PATH_TO_LIB)
# if [ ! -n "$CHANGED" ]; then
#     exit 0
# fi


# git diff --raw HEAD^1

# git diff HEAD^1 --name-only|grep shell

# echo $COMMIT

