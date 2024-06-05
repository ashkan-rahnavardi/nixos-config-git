-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.opt.winbar = "%=%m %f"
vim.g.lazygit_config = false

-- Create an augroup for the conf file type
vim.cmd([[
  augroup conf_syntax
    autocmd!
    autocmd BufRead,BufNewFile *.conf set filetype=conf
  augroup END
]])

-- Optional: If you want to add custom syntax highlighting rules for conf files
-- You can define them here if not already provided by default

-- Example: Basic syntax highlighting for conf files
vim.cmd([[
  if exists("b:current_syntax")
    finish
  endif
  syntax match confComment "#.*$"
  syntax match confSection "^\[.*\]"
  syntax match confKey "^\s*[a-zA-Z0-9_\-]\+\s*="
  syntax match confValue "=\s*\zs.*"
  highlight link confComment Comment
  highlight link confSection Identifier
  highlight link confKey Keyword
  highlight link confValue String
  let b:current_syntax = "conf"
]])
