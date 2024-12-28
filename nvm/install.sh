git clone https://github.com/nvm-sh/nvm.git $HOME/.config/nvm/.nvm
pushd $HOME/.config/nvm/.nvm
    git checkout v0.40.1
    . ./nvm.sh
popd

nvm install 20 && nvm use 20

echo "You will want to persist your \$NVM_DIR=$NVM_DIR"
