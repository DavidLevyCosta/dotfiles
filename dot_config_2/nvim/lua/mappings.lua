require "nvchad.mappings"

-- add yours here
local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("n", "<leader>db", ":DapToggleBreakpoint <cr>", { desc = "Toggle breakpoint"})
map("n", "<leader>dus",
    function ()
        local widgets = require('dap.ui.widgets');
        local sidebar = widgets.sidebar(widgets.scopes);
        sidebar.open();
    end,
    { desc = "Open debugging sidebar" }
)
map("n", "<leader>rcu",
    function ()
        require('crates').upgrade_all_crates()
    end,
    {desc = "Update crates"}
)
map("n", "<F5>", ":UndotreeToggle<cr>", { desc = "Undo tree"})
map("n", "<leader>gs", vim.cmd.Git, {desc = "Git status"})

map("v", "<M-Down>", ":m '>+1<CR>gv=gv")
map("v", "<M-Up>", ":m '<-2<CR>gv=gv")

local bufnr = vim.api.nvim_get_current_buf()
map("n", "<C-a>", function() vim.cmd.RustLsp('codeAction') end,
{ noremap = false, silent = true, buffer = bufnr }
)

map("x", "<C-p>", "\"_dP")
map('n', '<leader><C-c>', ':.y<CR>', { noremap = true })
map('v', '<C-c>', '"+y', { noremap = true })
map("n", "<C-z>", ":u<CR>", { noremap = true })
map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

map("n", "<C-Left>", ":TmuxNavigateLeft<cr>", { noremap = true, desc = "window left"})
map("n", "<C-Right>", ":TmuxNavigateRight<cr>", { noremap = true, desc = "window right"})
map("n", "<C-Down>", ":TmuxNavigateDown<cr>", { noremap = true, desc = "window down"})
map("n", "<C-Up>", ":TmuxNavigateUp<cr>", { noremap = true, desc = "window up"})
map("n", "<leader>rp", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left>", { desc = "replace"})
map("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>", { noremap = true })
