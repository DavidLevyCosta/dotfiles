local plugins = {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "rust-analyzer", "lua-language-server", "stylua",
      },
    },
  },
}
return plugins
