#!/usr/bin/env bash

# Check if 'stow' is installed
if ! command -v stow &> /dev/null; then
  echo "'stow' is not installed. Please install it and re-run this file."
  exit 1
fi

dirs_with_install_script=("fonts" "nvim" "nvm" "rust")
# Pass along any number of directory names to avoid installing them with this
# script. See the valid directories just above ^
dirs_to_ignore=( "$@" )

for dir in "${dirs_with_install_script[@]}"; do
    ignore=false
    for dir_to_ignore in "${dirs_to_ignore[@]}"; do
	if [[ "$dir" == "$dir_to_ignore" ]]; then
	    ignore=true
	    break
	fi
    done

    if $ignore; then
	echo "Skipping installation of $dir"
	continue
    fi

    . "$HOME/.config/$dir/install.sh"

done


pushd $HOME/.config
	stow . -t ~ \
	   --ignore="fonts" \
	   --ignore="nvm" \
	   --ignore="utils.sh" \
	   --ignore="setup.sh" 
popd
