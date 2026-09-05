#!/bin/bash
if [ -f "$1" ]; then
    echo "file exists: $1"
else
    echo "file does not exist: $1"
fi
