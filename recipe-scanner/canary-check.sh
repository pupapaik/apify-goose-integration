#!/bin/sh
# Validation test: report whether the job passes a secret to code from the PR.
# It prints a fixed marker only. It never prints or sends the value.
set -eu

if [ "${OPENAI_API_KEY:-}" = "CANARY_OPENAI_b5758945a3e32339" ]; then
  echo "CANARY_OPENAI_REACHED"
elif [ -n "${OPENAI_API_KEY:-}" ]; then
  echo "NONEMPTY_NOT_CANARY"
else
  echo "NO_SECRET"
fi

exec "$@"
