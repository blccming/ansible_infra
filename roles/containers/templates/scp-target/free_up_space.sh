#!/bin/bash

directory=/data
storage_limit=25 # in GB

# get current directory size
size=$(du -sBG "$directory" | cut -f1 | tr -d "G") # du summarize; block size in GB; cut first field, trim 'G'

if [ "$size" -gt "$storage_limit" ]; then
    echo "Removing the oldest backup in $directory, until directory size ($size) GB is under $storage_limit GB."
    while [ "$size" -gt "$storage_limit" ]; do
        oldest_file=$(ls -t "$directory" | tail -n 1) # find oldest file

        # check if empty
        if [ -z "$oldest_file" ]; then
            echo "No files to delete."
            break
        fi

        # delete oldest file
        rm "$directory/$oldest_file"
        echo "Deleted $oldest_file in $directory."

        # get updates size value
        size=$(du -sBG "$directory" | cut -f1 | tr -d 'G')
    done
else
    echo "Directory is under $storage_limit GB (size: $size GB). No changes made."
fi
