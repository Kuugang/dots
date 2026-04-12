return {
    "lewis6991/hover.nvim",
    lazy = false,
    config = function()
        require("hover").config({
            providers = {
                "hover.providers.lsp",
                "kuugang.hover.json_length_provider",
            },
        })
        local keymap = vim.keymap.set

        keymap("n", "<leader>al", function()
            local ft = vim.bo.filetype
            if ft == "json" then
                require("kuugang.hover.json_length_provider").execute(
                    { bufnr = vim.api.nvim_get_current_buf(), pos = vim.api.nvim_win_get_cursor(0) },
                    function(result)
                        if result then
                            vim.lsp.util.open_floating_preview(result.lines, result.filetype, { border = "single" })
                        else
                            require("hover").open()
                        end
                    end
                )
            else
                require("hover").open()
            end
        end, { desc = "Hover / JSON array length" })
    end,
}
