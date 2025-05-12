require("josean.core")
require("josean.lazy")

local wk = require("which-key")
wk.add({
    mode = { "v" },
    { "<leader>c", group = "Silicon" },
    {
        "<leader>cc",
        function()
            require("nvim-silicon").clip()
        end,
        desc = "Copy code screenshot to clipboard",
    },
    {
        "<leader>cf",
        function()
            require("nvim-silicon").file()
        end,
        desc = "Save code screenshot as file",
    },
    {
        "<leader>cs",
        function()
            require("nvim-silicon").shoot()
        end,
        desc = "Create code screenshot",
    },
})

wk.add({
    mode = { "n" },

    {
        "<leader>cs",
        function()
            vim.cmd("Telescope colorscheme")
        end,
        desc = "Change colorscheme",
    },
})

vim.cmd("colorscheme rose-pine-main")
