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
map("n", "<leader>zz", ":UndotreeToggle<cr>", { desc = "Undo tree"})
map("n", "<leader>gs", vim.cmd.Git, {desc = "Git status"})

map("v", "<M-Down>", ":m '>+1<CR>gv=gv")
map("v", "<M-Up>", ":m '<-2<CR>gv=gv")

map("x", "<C-p>", "\"_dP")

map('n', '<C-S-c>', ':.y<CR>', { noremap = true })
map('v', '<C-c>', '"+y', { noremap = true })
map('n', '<C-z>', ':u<CR>', { noremap = true })
map('n', '<C-S-z>',
    function()
        if last_change_dot then
            vim.cmd('undo')
            last_change_dot = false
        else
            vim.cmd('execute "normal! ."')
            last_change_dot = true
        end
    end,
    { noremap = true })

map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")




