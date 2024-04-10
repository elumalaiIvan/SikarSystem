#!/bin/bash

# Get the directory of the main script
SIKAR_SYSTEM_DIR="$(dirname "$(readlink -f "$0")")"
# imports external scripts
source "$SIKAR_SYSTEM_DIR/create.sh"
source "$SIKAR_SYSTEM_DIR/sMvnSettings.sh"


# Entry point
main() {
    for function_name in "$@"; do
        if declare -f "$function_name" > /dev/null; then
            "$function_name" "$@"
        else
            echo "Function '$function_name' does not exist"
        fi
    done
}

main "$@"
