local mason_ok, mason = pcall(require, "mason")
local mason_config_ok, mason_config = pcall(require, "mason-lspconfig")

if not mason_ok and mason_config_ok then
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
