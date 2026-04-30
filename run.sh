#!/bin/bash
# When the container is run without stdin attached, the server binary
# busy-loops on EOF. Detect that case and provide an infinite empty
# stdin stream so the binary always has an open (but idle) stdin.
if [ -t 0 ] || [ -p /dev/stdin ] || [ -f /dev/stdin ]; then
    exec /blockheads/blockheads_server171 "$@"
else
    exec /blockheads/blockheads_server171 "$@" < <(tail -f /dev/null)
fi
