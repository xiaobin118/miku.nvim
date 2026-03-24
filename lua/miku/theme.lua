local M = {}

local function hi(group, spec)
    vim.api.nvim_set_hl(0, group, spec)
end

local function link(group, target)
    vim.api.nvim_set_hl(0, group, { link = target })
end

function M.apply(p, opts)
    local bg = opts.transparent and "NONE" or p.bg

    vim.cmd("highlight clear")
    if vim.fn.exists("syntax_on") == 1 then vim.cmd("syntax reset") end
    vim.o.termguicolors = true
    vim.g.colors_name = "miku"

    -- Core UI
    hi("Normal", { fg = p.fg, bg = bg })
    hi("NormalNC", { fg = p.fg2, bg = bg })
    hi("EndOfBuffer", { fg = p.bg3, bg = bg })

    hi("CursorLine", { bg = p.bg2 })
    hi("CursorLineNr", { fg = p.miku, bold = true })
    hi("LineNr", { fg = p.muted })
    hi("SignColumn", { bg = bg })

    hi("Visual", { bg = p.bg3 })
    hi("Search", { fg = p.bg, bg = p.yellow, bold = true })
    hi("IncSearch", { fg = p.bg, bg = p.sand, bold = true })

    hi("WinSeparator", { fg = p.border })
    hi("VertSplit", { fg = p.border })

    hi("FloatBorder", { fg = p.border, bg = p.bg2 })
    hi("NormalFloat", { fg = p.fg2, bg = p.bg2 })

    hi("Pmenu", { fg = p.fg2, bg = p.bg2 })
    hi("PmenuSel", { fg = p.bg, bg = p.miku, bold = true })
    hi("PmenuSbar", { bg = p.bg3 })
    hi("PmenuThumb", { bg = p.muted })

    hi("StatusLine", { fg = p.fg2, bg = p.bg2 })
    hi("StatusLineNC", { fg = p.muted, bg = p.bg2 })

    -- Basic syntax (fallback)
    hi("Comment", { fg = p.muted, italic = true })
    hi("String", { fg = p.green })
    hi("Number", { fg = p.sand })
    hi("Boolean", { fg = p.sand })
    hi("Function", { fg = p.miku })
    hi("Identifier", { fg = p.fg })
    hi("Keyword", { fg = p.sky })
    hi("Operator", { fg = p.miku2 })
    hi("Type", { fg = p.miku2 })
    hi("Constant", { fg = p.sand })
    hi("Special", { fg = p.yellow })
    hi("MatchParen", { fg = p.yellow, bold = true })

    -- Diagnostics
    hi("DiagnosticError", { fg = p.red })
    hi("DiagnosticWarn", { fg = p.orange })
    hi("DiagnosticInfo", { fg = p.sky })
    hi("DiagnosticHint", { fg = p.miku })

    -- GitSigns
    hi("GitSignsAdd", { fg = p.green })
    hi("GitSignsChange", { fg = p.sand })
    hi("GitSignsDelete", { fg = p.red })

    -- Treesitter (links)
    link("@comment", "Comment")
    link("@string", "String")
    link("@number", "Number")
    link("@boolean", "Boolean")
    link("@function", "Function")
    link("@keyword", "Keyword")
    link("@operator", "Operator")
    link("@type", "Type")
    link("@constant", "Constant")
    link("@variable", "Identifier")

    -- Integrations
    require("miku.integrations.cmp").apply(p)
    require("miku.integrations.treesitter").apply(p)
    require("miku.integrations.bufferline").apply(p)
    require("miku.integrations.whichkey").apply(p)
end

return M
