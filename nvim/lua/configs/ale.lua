local setkey = vim.api.nvim_set_keymap
-- Ale config
vim.g.ale_fixers = {
  -- web
  javascript = { 'prettier', 'eslint' },
  typescript = { 'prettier', 'eslint' },
  typescriptreact = { 'prettier', 'eslint' },
  javascriptreact = { 'prettier', 'eslint' },
  json = { 'prettier' },
  css = { 'prettier' },
  scss = { 'prettier' },
  html = { 'prettier' },
  markdown = { 'prettier' },
  yaml = { 'prettier' },
  graphql = { 'prettier' },
  json = { 'prettier' },
  yaml = { 'prettier' },

  -- lua
  lua = { 'stylua' },

  -- python
  python = { 'black' },

  -- go
  go = { 'gofmt', 'golint', 'goimports' },

  -- rust
  rust = { 'rustfmt' },

  -- sh
  sh = { 'shfmt' },

  -- vim
  vim = { 'vimlint' },

  -- c
  c = { 'clang-format' },

  -- cpp
  cpp = { 'clang-format' },

  -- java
  java = { 'clang-format' },

  -- kotlin
  kotlin = { 'clang-format' },

  -- php
  php = { 'php-cs-fixer' },

  -- ruby
  ruby = { 'rufo' },

  -- swift
  swift = { 'swiftformat' },

}
vim.g.ale_fix_on_save = 1
vim.g.ale_rust_rustfmt_options = '--edition 2018'


-- we want to bind leader ft to toggle ale fix on save
setkey("n", "<leader>ft", ":let g:ale_fix_on_save = !g:ale_fix_on_save<CR>", { noremap = true, silent = true })
-- we want to bind leader fs to fix the current file
setkey("n", "<leader>fs", ":ALEFix<CR>", { noremap = true, silent = true })

local notify
function notifystart(msg)
  notify = vim.notify(msg, "warn", { title = "Code Formatter" })
end

function notifyend(msg)
  vim.notify(msg, "success", { title = "Code Formatter", replace = notify })
end

-- use the autocmd's alefixpre and alefixpost to show a message when the fix is done
vim.cmd([[
  augroup CodeFormatter
    autocmd!
    autocmd User ALEFixPre :lua notifystart("Fixing...")
    autocmd User ALEFixPost :lua notifyend("Fixed!")
  augroup END
]])