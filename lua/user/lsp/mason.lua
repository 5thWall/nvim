local mason_ok, mason = pcall(require, "mason")
local mason_config_ok, mason_config = pcall(require, "mason-lspconfig")
local lspconfig_ok, lspconfig = pcall(require, 'lspconfig')

if not mason_ok and mason_config_ok and lspconfig_ok then
  return
end

mason.setup({
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗"
    }
  }
})

mason_config.setup({
  ensure_installed = {
    "sumneko_lua",
    "rust_analyzer",
  }
})

mason_config.setup_handlers({
  function (server_name)
    lspconfig[server_name].setup {
      capabilities = require("user.lsp.handlers").capabilities,
    }
  end,
  ["sumneko_lua"] = function ()
    lspconfig.sumneko_lua.setup {
      capabilities = require("user.lsp.handlers").capabilities,
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim" },
          },
          workspace = {
            library = {
              [vim.fn.expand "$VIMRUNTIME/lua"] = true,
              [vim.fn.stdpath "config" .. "/lua"] = true,
            },
          },
          telemetry = {
            enable = false,
          },
        },
      },
    }
  end
})
