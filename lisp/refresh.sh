#!/bin/bash

if [ -d ietf-doc ]; then
    git pull git@github.com:choppsv1/ietf-doc.git
else
    git clone git@github.com:choppsv1/ietf-doc.git
fi
