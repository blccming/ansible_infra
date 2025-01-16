#!/bin/bash

SOURCE_POOL="naspool/naspool_data"
TARGET_POOL="backuppool/backuppool_data"
SNAPSHOT_NAME="$(date +%Y-%m-%d_%H-%M)"

# Create snapshot on source pool
zfs snapshot ${SOURCE_POOL}@${SNAPSHOT_NAME}

# Send the snapshot to the target pool
zfs send ${SOURCE_POOL}@${SNAPSHOT_NAME} | zfs receive ${TARGET_POOL}

# Remove the snapshot from source pool after sending
zfs destroy ${SOURCE_POOL}@${SNAPSHOT_NAME}
