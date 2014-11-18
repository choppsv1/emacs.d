#!/bin/bash
# flycheck
args=`getopt r:8: $*`
if [ $? != 0 ]; then
    echo 'Usage: ...'
    exit 2
fi
set -- $args
for i; do
    case "$i"
    in
        -r)
            lintconf="$2"; shift;
            shift;;
        -8)
            flakeconf="$2"; shift;
            shift;;
    esac
done
if [[ $flakeconf  ]]; then
    flakeconf=" --config=$flakeconf "
fi
if [[ $lintconf  ]]; then
    lintconf=" --rcfile=$lintconf "
fi
echo flake8 $flakeconf "$2"
flake8 $flakeconf "$2"
echo pylint $lintconf -r n --msg-template='{path}:{line}:{column}: {msg_id} {msg}' "$2"
pylint $lintconf -r n --msg-template='{path}:{line}:{column}: {msg_id} {msg}' "$2"

# flymake
# flake8 "$1"
# pylint --msg-template='{path}:{line}:{column}:[{msg_id}] {msg}' "$1"
# #/auto/xrut/bin/epylint  "$1"
# #pyflakes "$1"
# #flake8 "$1"
# # E201 - space after [
# # E202 - space before ]
# # E211 - space before (
# # E301 - no 1 blank line
# # E302 - no 2 blank lines
# # E302 -
# #pep8 --max-line-length=140 --ignore=E201,E202,E211,E301,E302 --repeat "$1"
# true
