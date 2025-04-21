local plugins = {
    {
        "rust-lang/rust.vim",
        ft = "rust",
        init = function()
            vim.g.rustfmt_autosave = 1
        end
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            require("nvchad.configs.lspconfig").defaults()
            require "configs.lspconfig"
        end,
    },
    {
        "mfussenegger/nvim-dap",
    },
    {
        "ldelossa/nvim-dap-projects",
    },
    {
        "mrcjkb/rustaceanvim",
        version = "^4",
        ft = { "rust" },
        lazy= true,
        config = function()
            vim.g.rustaceanvim = {
                server = {
                    on_attach = function(_, bufnr)
                        local bufnr = vim.api.nvim_get_current_buf()
                        vim.keymap.set(
                            "n",
                            "<leader>a",
                            function()
                                vim.cmd.RustLsp('codeAction')
                            end,
                            { silent = true, buffer = bufnr }
                        )
                    end,
                },
                dap = {
                    require("nvim-dap-projects").search_project_config()
                },
            }
        end,
    },
    {
        "saecki/crates.nvim",
        ft = {"rust", "toml"},
        config = function(_, opts)
            local crates = require('crates')
            crates.setup(opts)
            crates.show()
        end,
    },
    {
        "hrsh7th/nvim-cmp",
        opts = function ()
            local M = require "nvchad.configs.cmp"
            table.insert(M.sources, {name = "crates"})
            return M
        end,
    },
    {
        "max397574/better-escape.nvim",
        event = "InsertEnter",
        config = function()
            require("better_escape").setup()
        end,
    },
    {
        "mbbill/undotree",
        lazy = false,
    },
    {
        "tpope/vim-fugitive",
        lazy = false,
    },
    {
        "aserowy/tmux.nvim",
        config = function()
            require("tmux").setup()
        end,
    },
    {
        "christoomey/vim-tmux-navigator",
        lazy = false,
    },
}
return plugins
