# Install build dependencies on Ubuntu
sudo apt-get install ninja-build gettext cmake unzip curl build-essential

# Clone Neovim repository
git clone https://github.com/neovim/neovim

# Navigate into the Neovim directory
pushd neovim

# Remove the existing build directory to clear CMake cache
rm -r build/

# Build Neovim with the desired installation prefix
make CMAKE_BUILD_TYPE=Release CMAKE_INSTALL_PREFIX="$HOME/.config/nvim/build"

# Install Neovim to the specified location
make install 

# Return to the previous directory
popd

# Update PATH to include the bin directory of the custom install location
if [[ ":$PATH:" == *":$HOME/nivm/build/bin:"* ]]; then
  echo "nvim already in path"
else
  export PATH="$HOME/nvim/build/bin:$PATH"
  echo "nvim has been added to path"
fi

