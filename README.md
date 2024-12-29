# Dotfiles

This repo contains some dotfiles and scripts to get up and running with pretty
much everything I need to develop. This includes a fully configured
[Neovim](https://neovim.io/) installation, [nvm](https://github.com/nvm-sh/nvm),
[Nerd Fonts](https://www.nerdfonts.com/), [Starship](https://starship.rs), and
[Rust](https://www.rust-lang.org/).

The idea here is to have a development environment setup within minutes on
getting to a new machine. Currently this is only supported for Ubuntu so it may
not work for you, but it does for me :)

## Installation

First, you will need to clone the repo to `./config`. After this is done, run
the `setup.sh` script. This will install everything needed and symlink files for
you. You may need to persist some paths to your `$PATH` for persistance but
otherwise that should be it.

## Neovim

### What's Inside?

This setup comes with LSP, formatting, telescope, treesitter, debugging and more
already preconfigured. Take a look at their respective format in the
[`nvim/lua/config/plugins`](https://github.com/Squshy/dotfiles/tree/main/nvim/lua/config/plugins)
directory. This setup uses [Mason](https://github.com/williamboman/mason.nvim)
as a package manager to download LSP servers, DAP servers, linters, formaters
and more. Some servers will be installed by default
([see LSP config](https://github.com/Squshy/dotfiles/blob/main/nvim/lua/config/plugins/lsp.lua))
but if you require others, you can install, uninstall, or update them through
the Mason interface using `:Mason`.

#### Telescope

You will want to have `ripgrep` and `fd-find` installed to have this working
fully, this can be done by running `cargo install fd-find ripgrep`

### Making Changes

Most of the changes needed will be to the neovim setup which is in the `nvim`
directory. This setup is using [lazy.nvim](https://github.com/folke/lazy.nvim)
as a package manager. If you want to add new plugins, simply add a new file to
[`nvim/lua/config/plugins`](https://github.com/Squshy/dotfiles/tree/main/nvim/lua/config/plugins)
or modify any of the existing plugins.

## Starship

Install with `cargo install starship` and add `eval "$(starship init bash)"` to
your `.bashrc` to have it ready to go.

## NVM

Put this in your `.bashrc`:

```bash
export NVM_DIR="$HOME/nvm/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
```
