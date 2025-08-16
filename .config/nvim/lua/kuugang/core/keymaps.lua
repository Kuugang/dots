vim.g.mapleader = " "
vim.g.maplocalleader = ","

local keymap = vim.keymap

keymap.set("n", "j", "gj", { silent = true })
keymap.set("n", "k", "gk", { silent = true })

keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

keymap.set("n", "<leader>sH", "<cmd>nohl<CR>", { desc = "Clear search highlights" })
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" })
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" })

keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })

keymap.set("n", "<C-M-h>", "<C-w>H", { desc = "Move window to left" })
keymap.set("n", "<C-M-j>", "<C-w>J", { desc = "Move window to bottom" })
keymap.set("n", "<C-M-k>", "<C-w>K", { desc = "Move window to top" })
keymap.set("n", "<C-M-l>", "<C-w>L", { desc = "Move window to right" })

keymap.set("n", "=", [[<cmd>vertical resize +5<cr>]]) -- make the window biger vertically
keymap.set("n", "-", [[<cmd>vertical resize -5<cr>]]) -- make the window smaller vertically
keymap.set("n", "+", [[<cmd>horizontal resize +2<cr>]]) -- make the window bigger horizontally by pressing shift and =
keymap.set("n", "_", [[<cmd>horizontal resize -2<cr>]]) -- make the window smaller horizontally by pressing shift and -

keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" })
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" })
keymap.set("n", "<Tab>", "<cmd>tabnext<CR>", { desc = "Next tab" })
keymap.set("n", "<S-Tab>", "<cmd>tabprevious<CR>", { desc = "Previous tab" })

keymap.set("n", "<leader>sm", "<cmd>Telescope harpoon marks<CR>", { desc = "Show Harpoon Marks" })
keymap.set("n", "<leader>b", "<cmd>Telescope buffers<CR>", { desc = "Find buffers" })

keymap.set("n", "[", "<CMD>Oil --float<CR>", { desc = "Open parent directory" })
keymap.set("n", "{", "<CMD>Oil . --float<CR>", { desc = "Open parent directory" })

keymap.set("x", "p", '"_dP', { noremap = true, desc = "Paste without yanking" })

keymap.set("v", "<leader>cc", function()
    require("nvim-silicon").clip()
end, { desc = "Copy code screenshot to clipboard" })

keymap.set("v", "<leader>cf", function()
    require("nvim-silicon").file()
end, { desc = "Save code screenshot as file" })

keymap.set("v", "<leader>cs", function()
    require("nvim-silicon").shoot()
end, { desc = "Create code screenshot" })

keymap.set("n", "<leader>cs", function()
    vim.cmd("Telescope colorscheme")
end, { desc = "Change colorscheme" })
