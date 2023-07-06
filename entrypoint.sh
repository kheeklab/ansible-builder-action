#!/bin/bash

set -e

# Default value for the first argument
COMMAND="create"

# Check if the first argument is provided and valid
if [ ! -z "$1" ]; then
    if [ "$1" != "create" ] && [ "$1" != "build" ]; then
        echo "Invalid command. Please provide 'create' or 'build' as the first argument."
        exit 1
    fi
    COMMAND="$1"
fi

# Run ansible-builder command based on the provided argument
if [ "$COMMAND" == "create" ]; then
    ansible-builder create "${@:2}"
elif [ "$COMMAND" == "build" ]; then
    ansible-builder build "${@:2}"
fi
