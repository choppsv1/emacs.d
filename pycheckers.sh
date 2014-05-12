#!/bin/bash
flake8 "$1"
pylint --rcfile=~/xrut/modules/pylint.conf --msg-template='{path}:{line}:{column}:[{msg_id}] {msg}' -E "$1" 
#/auto/xrut/bin/epylint  "$1"
#pyflakes "$1"
#flake8 "$1"
# E201 - space after [
# E202 - space before ]
# E211 - space before (
# E301 - no 1 blank line
# E302 - no 2 blank lines
# E302 -
#pep8 --max-line-length=140 --ignore=E201,E202,E211,E301,E302 --repeat "$1"
true
