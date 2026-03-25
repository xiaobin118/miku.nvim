local M = {}

---@param colors table
function M.get(colors)
    local groups = {
        -- Base UI
        Normal = { fg = colors.fg, bg = colors.bg },
        NormalFloat = { fg = colors.fg, bg = colors.bg_highlight },
        ColorColumn = { bg = colors.bg_highlight },
        Cursor = { fg = colors.bg, bg = colors.fg },
        CursorLine = { bg = colors.bg_highlight },
        CursorColumn = { bg = colors.bg_highlight },

        -- Line Numbers (Make relative numbers visible!)
        LineNr = { fg = colors.gray },
        LineNrAbove = { fg = colors.gray },
        LineNrBelow = { fg = colors.gray },
        CursorLineNr = { fg = colors.cyan, bold = true },

        SignColumn = { bg = colors.bg },
        VertSplit = { fg = colors.border },
        WinSeparator = { fg = colors.border },
        Pmenu = { fg = colors.fg, bg = colors.bg_highlight },
        PmenuSel = { fg = colors.bg, bg = colors.cyan },
        Search = { fg = colors.bg, bg = colors.yellow },
        IncSearch = { fg = colors.bg, bg = colors.orange },
        Visual = { bg = colors.bg_highlight, bold = true },
        MatchParen = { fg = colors.magenta, bold = true },

        -- Standard Syntax
        Comment = { fg = colors.gray, italic = true },
        Constant = { fg = colors.orange },
        String = { fg = colors.green },
        Character = { fg = colors.green },
        Number = { fg = colors.orange },
        Boolean = { fg = colors.orange },
        Float = { fg = colors.orange },
        Identifier = { fg = colors.fg },
        Function = { fg = colors.blue },
        Statement = { fg = colors.magenta },
        Conditional = { fg = colors.magenta },
        Repeat = { fg = colors.magenta },
        Label = { fg = colors.magenta },
        Operator = { fg = colors.cyan },
        Keyword = { fg = colors.cyan, italic = true },
        Exception = { fg = colors.magenta },
        PreProc = { fg = colors.cyan },
        Include = { fg = colors.cyan },
        Define = { fg = colors.magenta },
        Macro = { fg = colors.magenta },
        Type = { fg = colors.yellow },
        StorageClass = { fg = colors.yellow },
        Structure = { fg = colors.yellow },
        Typedef = { fg = colors.yellow },
        Special = { fg = colors.blue },
        Error = { fg = colors.red },
        Todo = { fg = colors.bg, bg = colors.yellow, bold = true },

        -- Treesitter (Legacy / Neovim < 0.10)
        ["@variable"] = { fg = colors.fg },
        ["@property"] = { fg = colors.fg_dark },
        ["@field"] = { fg = colors.fg_dark },
        ["@parameter"] = { fg = colors.orange },
        ["@function"] = { fg = colors.blue },
        ["@function.builtin"] = { fg = colors.cyan },
        ["@keyword"] = { fg = colors.magenta, italic = true },
        ["@string"] = { fg = colors.green },
        ["@number"] = { fg = colors.orange },
        ["@type"] = { fg = colors.yellow },
        ["@operator"] = { fg = colors.cyan },
        ["@punctuation.bracket"] = { fg = colors.gray },
        ["@punctuation.delimiter"] = { fg = colors.gray },
        ["@module"] = { fg = colors.fg_dark },
        ["@constructor"] = { fg = colors.blue },

        -- Treesitter (Modern / Neovim >= 0.10) - This fixes your invisible words!
        ["@variable.member"] = { fg = colors.fg_dark },  -- fixes `capabilities`, `cmd`, `settings`
        ["@variable.parameter"] = { fg = colors.orange },
        ["@variable.builtin"] = { fg = colors.magenta }, -- fixes `vim`
        ["@module.builtin"] = { fg = colors.magenta },   -- fixes `vim` in some contexts
        ["@property.class"] = { fg = colors.fg_dark },
        ["@function.method"] = { fg = colors.blue },     -- fixes `nvim_set_keymap`
        ["@function.method.call"] = { fg = colors.blue },
        ["@keyword.import"] = { fg = colors.magenta },
        ["@keyword.function"] = { fg = colors.magenta },
        ["@keyword.return"] = { fg = colors.magenta },
    }

    return groups
end

return M
