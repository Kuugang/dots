return {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false,
    build = ":TSUpdate",
    dependencies = {
        "windwp/nvim-ts-autotag",
    },
    config = function()
        local ts = require("nvim-treesitter")

        -- Install parsers (skips already-installed ones)
        local ensure_installed = {
            "json",
            "javascript",
            "typescript",
            "tsx",
            "yaml",
            "html",
            "css",
            "prisma",
            "markdown",
            "markdown_inline",
            "svelte",
            "graphql",
            "bash",
            "lua",
            "vim",
            "dockerfile",
            "gitignore",
            "query",
            "vimdoc",
            "c",
        }
        local already_installed = require("nvim-treesitter.config").get_installed()
        local to_install = vim.iter(ensure_installed)
            :filter(function(p)
                return not vim.tbl_contains(already_installed, p)
            end)
            :totable()
        if #to_install > 0 then
            ts.install(to_install)
        end

        -- Enable highlighting + indentation per filetype
        vim.api.nvim_create_autocmd("FileType", {
            callback = function(args)
                pcall(vim.treesitter.start, args.buf)
                vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
            end,
        })

        -- Incremental selection
        vim.keymap.set("n", "<C-space>", function()
            require("nvim-treesitter.incremental_selection").init_selection()
        end)
    end,
}
