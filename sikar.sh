#!/bin/bash

# Get the directory of the main script
# imports external scripts
# Source all files from the source folder
#for file in $SIKAR_SYSTEM_DIR/source/*; do
#    if [ -f "$file" ]; then
#        source "$file"
#    fi
#done
SIKAR_SYSTEM_DIR="$(dirname "$(readlink -f "$0")")"
source "$SIKAR_SYSTEM_DIR/constants"

# Entry point
main() {
  if [ $# -eq 0 ]; then
    echo -e "$RED pass any one of the bellow operation as argument $NC"
    listFunctions
  else
    local function_name="$1"
    local function_path="$SIKAR_SOURCE_DIR/$function_name"
    if [ -f "$function_path" ]; then
      shift
      source "$function_path" "$@"
    else
      echo "operation '$function_name' does not exist"
      echo "try${GREEN} sikar help $NC"
    fi
  fi
}

main "$@"
