require("configs.lualine")
-- Main config lua
local g = vim.g
local cmd = vim.cmd
local opt = vim.opt
local setkey = vim.api.nvim_set_keymap

-- Map leader to space
g.mapleader = ' '

-- Split right
opt.splitright = true

-- Enable mouse
opt.mouse = "a"

-- Set formatoptions using autocmd
cmd [[
augroup FormatOptions
  autocmd!
  autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
augroup END
]]

-- Set tabstop
opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2


-- enable line numbers
opt.number = true
opt.relativenumber = true

-- enable syntax highlighting
opt.syntax = 'on'
opt.termguicolors = true

-- Set colorscheme
vim.cmd("autocmd Colorscheme * highlight NvimTreeNormal guibg=#373b4d")
vim.cmd("autocmd Colorscheme * highlight NvimTreeVertSplit guibg=#373b4d guifg=#373b4d")
cmd 'colorscheme dracula'


-- NvimTree config
require("nvim-tree").setup({
  open_on_setup = true,
  disable_netrw = true,
  hijack_netrw = true,
  view = {
    width = 30,
    side = "left",
  },
})


-- NvimTree keybindings
vim.api.nvim_set_keymap("n", "<leader>n", ":NvimTreeToggle<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>r", ":NvimTreeRefresh<CR>", { noremap = true, silent = true })

-- Telescope config
require('telescope').setup{
  pickers = {
    colorscheme = {
      enable_preview = true,
      theme = 'dropdown'
    }
  },
  defaults = {
    file_ignore_patterns = { "node_modules/*", "build/*" },
    prompt_prefix = "   ",
    selection_caret = "  ",
    entry_prefix = "  ",
    initial_mode = "insert",
    selection_strategy = "reset",
    sorting_strategy = "ascending",
    layout_strategy = "horizontal",
    layout_config = {
      horizontal = {
        prompt_position = "top",
        preview_width = 0.55,
        results_width = 0.8,
      },
      vertical = {
        mirror = false,
      },
      width = 0.87,
      height = 0.80,
      preview_cutoff = 120,
    },
  }
}

-- Telescope keybindings
vim.api.nvim_set_keymap("n", "<leader>ff", ":Telescope find_files<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>fg", ":Telescope live_grep<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>fb", ":Telescope buffers<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>fh", ":Telescope help_tags<CR>", { noremap = true, silent = true })

-- Bufferline config (we want to offset the bufferline by NvimTree)
require("bufferline").setup{
  options = {
    offsets = {{filetype = "NvimTree", text = "File Explorer", padding = 1}},
  }
}

-- Bufferline keybindings
setkey("n", "<leader>1", ":BufferLineGoToBuffer 1<CR>", { noremap = true, silent = true })
setkey("n", "<leader>2", ":BufferLineGoToBuffer 2<CR>", { noremap = true, silent = true })
setkey("n", "<leader>3", ":BufferLineGoToBuffer 3<CR>", { noremap = true, silent = true })
setkey("n", "<leader>4", ":BufferLineGoToBuffer 4<CR>", { noremap = true, silent = true })
setkey("n", "<leader>5", ":BufferLineGoToBuffer 5<CR>", { noremap = true, silent = true })
setkey("n", "<leader>6", ":BufferLineGoToBuffer 6<CR>", { noremap = true, silent = true })
setkey("n", "<leader>7", ":BufferLineGoToBuffer 7<CR>", { noremap = true, silent = true })
setkey("n", "<leader>8", ":BufferLineGoToBuffer 8<CR>", { noremap = true, silent = true })
setkey("n", "<leader>9", ":BufferLineGoToBuffer 9<CR>", { noremap = true, silent = true })
setkey("n", "<leader>0", ":BufferLineGoToBuffer 10<CR>", { noremap = true, silent = true })
-- We want ctrl + x to close the current buffer. If there is another buffer open, we want to switch bufferline to it
function close_buffer()
  local buf_count = vim.fn.bufnr("$")
  if buf_count == 1 then
    vim.cmd("q")
  else
    vim.cmd("bd")
    vim.cmd("BufferLineCycleNext")
  end
end
setkey("n", "<C-x>", ":lua close_buffer()<CR>", { noremap = true, silent = true })

-- Ale config
vim.g.ale_fixers = {
  javascript = { 'prettier' },
  typescript = { 'prettier' },
  typescriptreact = { 'prettier' },
  json = { 'prettier' },
  css = { 'prettier' },
  scss = { 'prettier' },
  html = { 'prettier' },
  markdown = { 'prettier' },
  yaml = { 'prettier' },
  graphql = { 'prettier' },
  vue = { 'prettier' },
  lua = { 'stylua' },
}
vim.g.ale_fix_on_save = 1

-- Coc config (tab/shift-tab for autocomplete, enter for accept) 
-- vim.api.nvim_set_keymap("i", "<TAB>", "coc#pum#visible() ? coc#pum#next(1) : CheckBackspace() ? \"\\<Tab>\" : coc#refresh()", { expr = true, noremap = true, silent = true })
-- vim.api.nvim_set_keymap("i", "<S-TAB>", "coc#pum#visible() ? coc#pum#prev(1) : \"<S-Tab>\"", { expr = true, noremap = true, silent = true })
-- vim.api.nvim_set_keymap("i", "<CR>", "coc#pum#visible() ? coc#pum#confirm() : \"<CR>\"", { expr = true, noremap = true, silent = true })

-- -- Coc checkbackspace function
-- vim.cmd [[
-- function! CheckBackspace() abort
--   let col = col('.') - 1
--   return !col || getline('.')[col - 1]  =~# '\s'
-- endfunction
-- ]]

-- Copilot config
vim.g.copilot_no_tab_map = true

-- Copilot keybindings
setkey("i", "<C-j>", "copilot#Accept()", { noremap = true, silent = true, expr = true })

-- Fugitive mappings
setkey("n", "<leader>ga", ":Git add %<CR>", { noremap = true })
setkey("n", "<leader>gaa", ":Git add .<CR>", { noremap = true })
setkey("n", "<leader>gc", ":Git commit -m ''<Left>", { noremap = true })

-- IndentLine config
require("indent_blankline").setup {
    -- for example, context is off by default, use this to turn it on
    show_current_context = true,
    show_current_context_start = true,
}

-- LSP
local lsp = require('lsp-zero')

lsp.preset('lsp-compe')
lsp.setup() 

-- re-enable virtual text
vim.diagnostic.config({
    virtual_text = true,
})

-- Cmp config (mostly just to set a border, but also to set the tab/shift-tab for autocomplete)
local cmp = require('cmp')
local function border(hl_name)
  return {
    { "╭", hl_name },
    { "─", hl_name },
    { "╮", hl_name },
    { "│", hl_name },
    { "╯", hl_name },
    { "─", hl_name },
    { "╰", hl_name },
    { "│", hl_name },
  }
end
cmp.setup({
  window = {
    completion = {
      border = border "CmpBorder",
    }, 
  },
  formatting = {
    format = require("lspkind").cmp_format({
      mode = 'symbol',
      maxwidth = 50,
      -- symbol map using firacode
      symbol_map = {
        Text = "",
				Method = "",
				Function = "",
				Constructor = "",
				Field = "ﰠ",
				Variable = "",
				Class = "ﴯ",
				Interface = "",
				Module = "",
				Property = "ﰠ",
				Unit = "塞",
				Value = "",
				Enum = "",
				Keyword = "",
				Snippet = "",
				Color = "",
				File = "",
				Reference = "",
				Folder = "",
				EnumMember = "",
				Constant = "",
				Struct = "פּ",
				Event = "",
				Operator = "",
				TypeParameter = "",
      }
    }),
  },
  sources = {
    {name = "nvim_lsp"},
    {name = "buffer"},
    {name = "path"},
    {name = "luasnip"},
  },
  completion = {
    completeopt = "menu,menuone,noinsert",
  },
  mapping = {
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
    ["<C-e>"] = cmp.mapping.close(),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
    ["<C-y>"] = cmp.mapping.confirm({ select = true }),
    ["<Esc>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.close()
      else
        fallback()
      end
    end, {"i"}),
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      else
        fallback()
      end
    end, { "i", "s" }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      else
        fallback()
      end
    end, { "i", "s" }),
  },
})


