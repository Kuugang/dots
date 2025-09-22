return {
    "yetone/avante.nvim",
    build = vim.fn.has("win32") ~= 0 and "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false"
        or "make",
    event = "VeryLazy",
    version = false, -- Never set to "*"
    opts = {
        -- Basic configuration
        instructions_file = "avante.md",
        provider = "copilot",

        providers = {
            copilot = {
                endpoint = "https://api.githubcopilot.com",
                allow_insecure = false,
                timeout = 10 * 60 * 1000,
                extra_request_body = {
                    temperature = 0,
                    max_completion_tokens = 1000000,
                },
            },
        },

        -- MCP integration (only if mcphub is available)
        system_prompt = function()
            local ok, mcphub = pcall(require, "mcphub")
            if not ok then
                error("Failed to load mcphub module", 2) -- 2 means blame caller’s line
            end
            local hub = mcphub.get_hub_instance()
            return hub and hub:get_active_servers_prompt() or ""
        end,

        custom_tools = function()
            local ok, mcphub_avante = pcall(require, "mcphub.extensions.avante")
            if not ok then
                error("Failed to load mcphub extension avante", 2)
            end
            return {
                mcphub_avante.mcp_tool(),
            }
        end,
    },
    dependencies = {
        "nvim-lua/plenary.nvim",
        "MunifTanjim/nui.nvim",
        "echasnovski/mini.pick",
        "nvim-telescope/telescope.nvim",
        "hrsh7th/nvim-cmp",
        "ibhagwan/fzf-lua",
        "stevearc/dressing.nvim",
        "folke/snacks.nvim",
        "nvim-tree/nvim-web-devicons",
        "zbirenbaum/copilot.lua",
        "ravitemer/mcphub.nvim",
        {
            "HakonHarnes/img-clip.nvim",
            event = "VeryLazy",
            opts = {
                default = {
                    embed_image_as_base64 = false,
                    prompt_for_file_name = false,
                    drag_and_drop = { insert_mode = true },
                    use_absolute_path = true,
                },
            },
        },
        {
            "MeanderingProgrammer/render-markdown.nvim",
            opts = {
                file_types = { "markdown", "Avante" },
            },
            ft = { "markdown", "Avante" },
        },
    },
}
