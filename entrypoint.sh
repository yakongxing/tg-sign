#!/bin/sh
set -e
python -m http.server $PORT & tg-signer run mytask
