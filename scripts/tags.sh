#!/usr/bin/env bash

if [[ -z "$1" ]]; then
    find problems/ -name '*.tags' -exec cat {} + | tr ' ' '\n' | sort | uniq -c
    exit $?
fi

grep --color=always --exclude-dir=.dmoj -Rl "$1" problems/ | sed s#\/.tags##g
