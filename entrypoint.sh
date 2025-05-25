#!/bin/sh
set -e
python -m http.server $PORT 2& > /dev/null &

tg-signer run mytask
