return {
  {
    -- NOTE: Make sure you have ripgrep and fd-find installed
    -- This can be done with `cargo install fd-find ripgrep`
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim',
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release' }
    },
    config = function()
      vim.keymap.set("n", "<space>pf", require "telescope.builtin".find_files)
      vim.keymap.set("n", "<space>ps", require "telescope.builtin".live_grep)
      vim.keymap.set("n", "<space>en", function()
        require "telescope.builtin".find_files {
          cwd = vim.fn.stdpath("config"),
          no_ignore = false,
          no_ignore_parent = false,
          hidden = false
        }
      end)
    end
  }
}
