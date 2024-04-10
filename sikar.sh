#!/bin/bash

# Get the directory of the main script
main_script_dir="$(dirname "$(readlink -f "$0")")"
# imports external scripts
source "$main_script_dir/create.sh"
source "$main_script_dir/sMvnSettings.sh"


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
