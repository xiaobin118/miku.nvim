local M = {}

M.options = {
    style = "dark",     -- "dark" | "light"
    transparent_background = false,
    term_colors = true, -- sets terminal colors (e.g. `g:terminal_color_0`)
    styles = {
        comments = { italic = true },
        keywords = { italic = false },
        functions = { bold = false },
        variables = {},
    },
    integrations = {
        cmp = true,
        treesitter = true,
        bufferline = true,
        whichkey = true,
        -- add more as you grow!
    },
    color_overrides = {},   -- e.g., color_overrides = { dark = { bg = "#000000" } }
    custom_highlights = {}, -- e.g., custom_highlights = { Comment = { fg = "#ff0000" } }
}

function M.setup(opts)
    M.options = vim.tbl_deep_extend("force", M.options, opts or {})
end

return M
