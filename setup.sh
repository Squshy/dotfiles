#!/usr/bin/env bash

SOURCED=false
if [[ "$0" != "$BASH_SOURCE" ]]; then
    SOURCED=true
fi

# Check if 'stow' is installed
if ! command -v stow &> /dev/null; then
    echo "'stow' is not installed. Please install it and re-run this file."
    if $SOURCED; then
        return 1
    else 
	exit 0
    fi
fi

DIRS_WITH_INSTALL_SCRIPT=("fonts" "nvim" "nvm" "rust", "tmux")
ARGS=( "$@" )
DIRS_TO_INSTALL=()

if [[ "${1}" == "--help" ]]; then
    echo "Call this script without any arguments to do a basic install"
    echo "Pass --install followed by a list of directories to specifically install \
	if you only want to install a subset of directories"
    echo "Pass --ignore followed by a list of directories you wish to ignore from \
	the basic set of directories"
    echo "The following are the accepted directories: fonts, nvim, nvm, rust, tmux"
    if $SOURCED; then
	return 0
    else 
	exit 0
    fi
fi

if [[ "${ARGS[0]}" == "--install" ]]; then
    DIRS_TO_INSTALL=("${ARGS[@]:1}")
elif [[ "${ARGS[0]}" == "--ignore" ]]; then
    for DIR in "${DIRS_WITH_INSTALL_SCRIPT[@]}"; do
	IGNORE=false
	for ARG in "${ARGS[@]:1}"; do
	    if [[ "$DIR" == "$ARG" ]]; then
		IGNORE=true
		break
	    fi
	done

	if [[ $IGNORE == true ]]; then
	    echo "Skipping installation of $DIR"
	    continue
	fi

	DIRS_TO_INSTALL+=("$DIR")
    done
else 
    DIRS_TO_INSTALL=("${DIRS_WITH_INSTALL_SCRIPT[@]}")
fi

for DIR in "${DIRS_TO_INSTALL[@]}"; do
    . "$HOME/.config/$DIR/install.sh"

done


pushd $HOME/.config
	stow . -t ~ \
	   --ignore="fonts" \
	   --ignore="utils.sh" \
	   --ignore="starship.toml" \
	   --ignore="setup.sh" 
popd
