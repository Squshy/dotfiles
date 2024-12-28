return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "nvim-neotest/nvim-nio",
      "williamboman/mason.nvim",
      "mrcjkb/rustaceanvim", -- rust
    },
    config = function()
      local dap = require 'dap'
      local ui = require 'dapui'

      require "dapui".setup()

      -- Setup Rust debugger
      vim.g.rustaceanvim = function()
        HOME_PATH = os.getenv("HOME") .. "/"
        MASON_PATH = HOME_PATH .. ".local/share/nvim/mason/packages/"
        local codelldb_path = MASON_PATH .. "codelldb/extension/adapter/codelldb"
        local liblldb_path = MASON_PATH .. "codelldb/extension/lldb/lib/liblldb.so"

        local cfg = require('rustaceanvim.config')
        return {
          dap = {
            adapter = cfg.get_codelldb_adapter(codelldb_path, liblldb_path),
          },
        }
      end


      vim.keymap.set("n", "<space>b", dap.toggle_breakpoint)
      vim.keymap.set("n", "<space>cc", dap.toggle_breakpoint)
      vim.keymap.set("n", "<space>?", function()
        require("dapui").eval(nil, { enter = true })
      end)

      vim.keymap.set("n", "<F1>", dap.continue)
      vim.keymap.set("n", "<F2>", dap.step_into)
      vim.keymap.set("n", "<F3>", dap.step_over)
      vim.keymap.set("n", "<F4>", dap.step_out)
      vim.keymap.set("n", "<F5>", dap.step_back)
      vim.keymap.set("n", "<F10>", dap.restart)

      dap.listeners.before.attach.dapui_config = function()
        ui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        ui.open()
      end
      dap.listeners.before.event_terminated.dapui_config = function()
        ui.close()
      end
      dap.listeners.before.event_exited.dapui_config = function()
        ui.close()
      end
    end
  }
}
