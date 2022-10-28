-- mappings
-- Main config lua
local g = vim.g
local cmd = vim.cmd
local setkey = vim.api.nvim_set_keymap

-- Set leader key
g.mapleader = ' '

-- Telescope mappings
setkey("n", "<leader>ff", ":Telescope find_files<CR>", {
    noremap = true,
    silent = true
})
setkey("n", "<leader>fg", ":Telescope live_grep<CR>", {
    noremap = true,
    silent = true
})
setkey("n", "<leader>fb", ":Telescope buffers<CR>", {
    noremap = true,
    silent = true
})
setkey("n", "<leader>fh", ":Telescope help_tags<CR>", {
    noremap = true,
    silent = true
})

-- NeoTree mappings
setkey("n", "<leader>n", ":Neotree filesystem<CR>", {
    noremap = true,
    silent = true
})
setkey("n", "<leader>nf", ":Neotree filesystem<CR>", {
    noremap = true,
    silent = true
})
setkey("n", "<leader>nb", ":Neotree buffers<CR>", {
    noremap = true,
    silent = true
})
setkey("n", "<leader>ng", ":Neotree git_status<CR>", {
    noremap = true,
    silent = true
})

-- Session Manager mappings
setkey("n", "<leader>ss", "<cmd>SessionManager! save_current_session<cr>", {
    noremap = true,
    silent = true
})
setkey("n", "<leader>sl", "<cmd>SessionManager! load_last_session<cr>", {
    noremap = true,
    silent = true
})
setkey("n", "<leader>sd", "<cmd>SessionManager! delete_current_session<cr>", {
    noremap = true,
    silent = true
})
setkey("n", "<leader>sa", "<cmd>SessionManager! load_session<cr>", {
    noremap = true,
    silent = true
})

-- Map K to show documentation in a preview window
setkey("n", "K", ":lua vim.lsp.buf.hover()<CR>", {
    noremap = true,
    silent = true
})

-- Trouble mappings
setkey("n", "<leader>xx", "<cmd>TroubleToggle<cr>", {
    noremap = true,
    silent = true
})
setkey("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>", {
    noremap = true,
    silent = true
})
setkey("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>", {
    noremap = true,
    silent = true
})
setkey("n", "<leader>xl", "<cmd>TroubleToggle loclist<cr>", {
    noremap = true,
    silent = true
})
setkey("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>", {
    noremap = true,
    silent = true
})
setkey("n", "gR", "<cmd>TroubleToggle lsp_references<cr>", {
    noremap = true,
    silent = true
})
