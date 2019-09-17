#!/bin/sh -e

: ${KOSH_SYNC_BRANCH:="master"}
: ${KOSH_SYNC_FOLDER:="/var/lib/kosh"}
: ${KOSH_SYNC_ORIGIN:=""}
: ${KOSH_SYNC_REPOSE:="3h"}

if test -z "$KOSH_SYNC_ORIGIN"; then
  echo "Please provide origin via KOSH_SYNC_ORIGIN envrionment variable"
  echo "Exiting" >&2
  exit 1
fi

while true; do
  echo -n "$(date +"%Y-%m-%d %H:%M:%S") [sync] "
  git -C "$KOSH_SYNC_FOLDER" pull "$KOSH_SYNC_ORIGIN" "$KOSH_SYNC_BRANCH" 2>&1 \
    | tail -n+3

  sleep $KOSH_SYNC_REPOSE
done
