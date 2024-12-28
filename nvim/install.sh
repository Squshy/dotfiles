#!/usr/bin/env bash
source $HOME/.config/utils.sh

# Install build dependencies on Ubuntu
sudo apt-get install ninja-build gettext cmake unzip curl build-essential

git clone https://github.com/neovim/neovim

pushd neovim

rm -r build/

make CMAKE_BUILD_TYPE=Release CMAKE_INSTALL_PREFIX="$HOME/.config/nvim/build"
make install 

popd

add_to_path "nvim" "$HOME/nivm/build/bin"
