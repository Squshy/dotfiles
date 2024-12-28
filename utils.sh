#!/usr/bin/env bash

add_to_path() {
    TITLE=$1
    NEW_PATH=$2

    if [[ ":$PATH:" == *":$NEW_PATH:"* ]]; then
      echo "$TITLE already in path at $NEW_PATH"
      return false
    fi

    export PATH="$NEW_PATH:$PATH"
    echo "$TITLE has been added to path at $NEW_PATH. You will want to persist this."
    return true
}

