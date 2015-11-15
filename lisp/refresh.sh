#!/bin/bash

if [ -d ietf-doc ]; then
    git pull git@github.com:choppsv1/theme-looper.git
else
    git clone git@github.com:choppsv1/theme-looper.git
fi
