local ts_utils = require("nvim-treesitter.ts_utils")

local function get_array_length()
    local node = ts_utils.get_node_at_cursor()
    print("node: " .. vim.inspect(node))
    while node do
        local t = node:type()
        print("node type: " .. t)
        if t == "array" then
            local count = 0
            for child in node:iter_children() do
                local ct = child:type()
                if ct ~= "[" and ct ~= "]" and ct ~= "," then
                    count = count + 1
                end
            end
            return count
        end
        node = node:parent()
    end
    return nil
end

return {
    name = "JSON Array Length",
    priority = 1000,
    enabled = function(bufnr)
        print("enabled called, ft: " .. vim.bo[bufnr].filetype)
        return vim.bo[bufnr].filetype == "json"
    end,
    execute = function(params, done)
        print("execute called!")
        local len = get_array_length()
        print("len: " .. tostring(len))
        if not len then
            done(nil)
            return
        end
        done({ lines = { "📦 Array length: " .. len }, filetype = "markdown" })
    end,
}
