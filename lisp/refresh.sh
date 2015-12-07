#!/bin/bash

REPOS="mu4e-maildirs-extension theme-looper"

for repo in $REPOS; do
    if [ -d $repo ]; then
        (cd $repo && git pull)
    else
        git clone git@github.com:choppsv1/$repo.git
    fi
done
