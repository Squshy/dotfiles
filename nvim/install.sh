# Install build dependencies on Ubuntu
sudo apt-get install ninja-build gettext cmake unzip curl build-essential

git clone https://github.com/neovim/neovim

pushd neovim

rm -r build/

make CMAKE_BUILD_TYPE=Release CMAKE_INSTALL_PREFIX="$HOME/.config/nvim/build"
make install 

popd

if [[ ":$PATH:" == *":$HOME/nivm/build/bin:"* ]]; then
  echo "nvim already in path"
else
  export PATH="$HOME/nvim/build/bin:$PATH"
  echo "nvim has been added to path"
fi

