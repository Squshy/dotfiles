#!/usr/bin/env bash
source $HOME/.config/utils.sh

curl --silent --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
rustup update

DEST=$HOME/.config/rust/bin

mkdir -p $DEST
curl --silent -L https://github.com/rust-lang/rust-analyzer/releases/latest/download/rust-analyzer-x86_64-unknown-linux-gnu.gz  | gunzip -c - > $DEST/rust-analyzer
chmod +x $DEST/rust-analyzer


add_to_path "rust-analyzer" "$HOME/rust/bin"
