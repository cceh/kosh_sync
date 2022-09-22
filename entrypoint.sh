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

if test ! -d "$KOSH_SYNC_FOLDER/.git"; then
  echo -n "$(date +"%Y-%m-%d %H:%M:%S") [INIT] "
  git clone -b "$KOSH_SYNC_BRANCH" "$KOSH_SYNC_ORIGIN" "$KOSH_SYNC_FOLDER" \
     2>&1 | head -n1
fi

while true; do
  echo -n "$(date +"%Y-%m-%d %H:%M:%S") [SYNC] "
  git -C "$KOSH_SYNC_FOLDER" pull "$KOSH_SYNC_ORIGIN" "$KOSH_SYNC_BRANCH" \
    2>&1 | head -n1

  sleep $KOSH_SYNC_REPOSE
done
