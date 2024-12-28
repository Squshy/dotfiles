#!/usr/bin/env bash
source $HOME/.config/utils.sh

DEST=$HOME/.config/rust/bin

mkdir -p $DEST
curl --silent -L https://github.com/rust-lang/rust-analyzer/releases/latest/download/rust-analyzer-x86_64-unknown-linux-gnu.gz  | gunzip -c - > $DEST/rust-analyzer
chmod +x $DEST/rust-analyzer


add_to_path "rust" "$HOME/rust/bin"
