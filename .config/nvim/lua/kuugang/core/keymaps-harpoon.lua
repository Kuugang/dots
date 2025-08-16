local M = {}

function M.setup_keymaps(harpoon)
    local list = harpoon:list()
    local keymap = vim.keymap.set

    keymap("n", "<leader>a", function()
        list:add()
    end, { desc = "Harpoon: Add file" })

    keymap("n", "<C-[>", function()
        harpoon.ui:toggle_quick_menu(list)
    end, { desc = "Harpoon: Toggle menu" })

    keymap("n", "<leader>p", function()
        list:prev()
    end, { desc = "Harpoon: Previous file" })

    keymap("n", "<leader>n", function()
        list:next()
    end, { desc = "Harpoon: Next file" })
end

return M
