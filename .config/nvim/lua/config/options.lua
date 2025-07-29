-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.g.mapleader = ","
vim.opt.clipboard = "unnamedplus"

local function macos()
  return vim.fn.has("macunix") > 0
end

local pyenv_root = os.getenv("PYENV_ROOT")

if macos() then
  vim.g.python_host_prog = pyenv_root .. "/versions/2.7.18/bin/python"
  vim.g.python3_host_prog = pyenv_root .. "/versions/3.9.6/bin/python"
else
  vim.g.python_host_prog = pyenv_root .. "/versions/2.7.18/bin/python"
  vim.g.python3_host_prog = pyenv_root .. "/versions/3.12.0/envs/neovim3/bin/python"
end

vim.g.lazyvim_python_lsp = "pyright"
vim.g.lazyvim_python_ruff = "ruff_lsp"
