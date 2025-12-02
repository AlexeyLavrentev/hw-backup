#!/bin/bash

SRC="$HOME/"
DEST="/tmp/backup/"
LOGTAG="rsync_backup"

mkdir -p "$DEST"

rsync -avh --delete --checksum --exclude='.*' "$SRC" "$DEST"
STATUS=$?

if [ "$STATUS" -eq 0 ]; then
    logger -t "$LOGTAG" "Backup completed successfully"
else
    logger -t "$LOGTAG" "Backup FAILED with status $STATUS"
fi

exit "$STATUS"
