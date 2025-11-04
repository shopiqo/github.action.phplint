#!/bin/bash

set -xe

LINTER_PATH="/root/.composer/vendor/bin/phplint -vvv"
CONFIG_FILE="/github/workspace/${INPUT_CONFIG_FILE}"
TARGET_PATH="/github/workspace/${INPUT_PATH}"

if [ -f "$CONFIG_FILE" ]; then
    CMD="$LINTER_PATH -c $CONFIG_FILE -- $TARGET_PATH"
else
    CMD="$LINTER_PATH --no-configuration"

    if [ "$INPUT_WARNING" = "true" ]; then
        CMD="$CMD --warning"
    fi

    IFS=',' read -ra EXCLUDES <<< "$INPUT_EXCLUDE"
    for exclude in "${EXCLUDES[@]}"; do
        CMD="$CMD --exclude=$exclude"
    done

    IFS=',' read -ra EXTENSIONS <<< "$INPUT_EXTENSIONS"
    for extension in "${EXTENSIONS[@]}"; do
        CMD="$CMD --extensions=$extension"
    done

    CMD="$CMD --jobs=${INPUT_JOBS}"
    CMD="$CMD -- $TARGET_PATH"
fi

sh -c "$CMD"
