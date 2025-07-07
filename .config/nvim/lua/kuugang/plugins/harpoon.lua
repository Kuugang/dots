return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    event = "VeryLazy",

    config = function()
        local harpoon = require("harpoon")
        harpoon:setup()

        require("kuugang.core.keymaps-harpoon").setup_keymaps(harpoon)
    end,
}
