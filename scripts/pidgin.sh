#!/bin/sh

PIDGIN=${1:-/usr/bin/pidgin}
RET=1
while [ "$RET" -ne 0 ]; do
    if [ -x "$PIDGIN" ]; then
        "$PIDGIN"
        RET=$?
    else
        echo "Error: pidgin not installed at $PIDGIN" >&2
    fi
done
