#!/usr/bin/env bash

# stow this entire dir except for these guys
# stow this way so I have have directories, instead of loose files
stow $HOME/.config -t ~/ \
    --ignore="fonts" \
    --ignore="nvm" \
    --ignore="stow.*" \
    --ignore="README.md" \
    --ignore=".prettierrc" 
