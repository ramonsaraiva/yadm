-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local keymap = vim.keymap

keymap.del("n", "<A-j>")
keymap.del("n", "<A-k>")
keymap.del("i", "<A-j>")
keymap.del("i", "<A-k>")
keymap.del("v", "<A-j>")
keymap.del("v", "<A-k>")

keymap.set("n", "<space>", "viw")
keymap.set("n", "<leader>a", "=ip")
keymap.set("n", "<leader>q", "<cmd>q<cr>")
keymap.set("n", "<leader>w", "<cmd>w<cr>")
keymap.set("n", "<leader>/", "<cmd>nohlsearch<cr>")
keymap.set("n", "<leader>v", "<c-w>v<cr>")
keymap.set("n", "<leader>h", "<c-w>n<cr>")
keymap.set("n", "<s-l>", "gt")
keymap.set("n", "<s-h>", "gT")
keymap.set("n", "<c-l>", "<c-w>l")
keymap.set("n", "<c-h>", "<c-w>h")
keymap.set("n", "<c-j>", "<c-w>j")
keymap.set("n", "<c-k>", "<c-w>k")
keymap.set("n", "<leader>d", "iimport pdb; pdb.set_trace()<esc>")
keymap.set("n", "<leader>dd", "iimport ipdb; ipdb.set_trace()<esc>")

-- plugins
keymap.set("n", "<leader>r", "<cmd>Ranger<cr>")
keymap.set("n", "<leader>n", "<cmd>Neotree<cr>")
keymap.set("n", "<leader>t", "<cmd>TagbarToggle<cr>")
keymap.set("n", "<leader>gb", "<cmd>Git blame<cr>")
keymap.set("n", "<leader>go", "<cmd>Goyo<cr>")
keymap.set("n", "<leader>do", "<cmd>DockerToolsOpen<cr>")
keymap.set("n", "<leader>dc", "<cmd>DockerToolsClose<cr>")
keymap.set("n", "<leader>o", ":Octo ")
keymap.set("n", "<c-t>n", "<cmd>TestNearest<cr>")
keymap.set("n", "<c-t>f", "<cmd>TestFile<cr>")
keymap.set("n", "<c-t>l", "<cmd>TestLast<cr>")
keymap.set("n", "<c-t>v", "<cmd>TestVisit<cr>")

-- config files shortcuts
keymap.set("n", "<leader>rc", "<cmd>vsplit ~/.cfg/nvim/lua/init.lua<cr>")
keymap.set("n", "<leader>rp", "<cmd>vsplit ~/.cfg/nvim/lua/plugins.lua<cr>")
keymap.set("n", "<leader>rm", "<cmd>vsplit ~/.cfg/nvim/lua/mappings.lua<cr>")
keymap.set("n", "<leader>kc", "<cmd>vsplit ~/.cfg/kitty.conf<cr>")
keymap.set("n", "<leader>kt", "<cmd>vsplit ~/.config/kitty/kitty-themes/themes/moonlight.conf<cr>")
