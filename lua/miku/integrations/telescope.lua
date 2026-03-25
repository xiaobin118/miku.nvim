local M = {}

---@param colors table The palette colors
function M.get(colors)
    -- Note: Adjust `colors.cyan`, `colors.bg_highlight`, etc., to match the actual names in your palette.lua
    return {
        TelescopeBorder = { fg = colors.border or colors.gray },

        -- Prompt area
        TelescopePromptBorder = { fg = colors.cyan },
        TelescopePromptNormal = { fg = colors.fg },
        TelescopePromptPrefix = { fg = colors.magenta or colors.cyan },
        TelescopePromptTitle = { fg = colors.bg, bg = colors.cyan, bold = true },

        -- Results area
        TelescopeResultsNormal = { fg = colors.fg },
        TelescopeResultsBorder = { fg = colors.border or colors.gray },
        TelescopeResultsTitle = { fg = colors.bg, bg = colors.blue, bold = true },

        -- Preview area
        TelescopePreviewNormal = { fg = colors.fg },
        TelescopePreviewBorder = { fg = colors.border or colors.gray },
        TelescopePreviewTitle = { fg = colors.bg, bg = colors.green, bold = true },

        -- Selection and matching
        TelescopeSelection = { bg = colors.bg_highlight or colors.selection, bold = true },
        TelescopeSelectionCaret = { fg = colors.cyan },
        TelescopeMatching = { fg = colors.cyan, bold = true },
    }
end

return M
