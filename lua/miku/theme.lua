local M = {}

local function hi(group, spec)
    vim.api.nvim_set_hl(0, group, spec)
end

local function link(group, target)
    vim.api.nvim_set_hl(0, group, { link = target })
end

function M.apply(p, opts)
    local bg = opts.transparent_background and "NONE" or p.bg
    local bg_float = opts.transparent_background and "NONE" or p.bg_float
    local bg_dark = opts.transparent_background and "NONE" or p.bg_dark

    vim.cmd("highlight clear")
    if vim.fn.exists("syntax_on") == 1 then vim.cmd("syntax reset") end
    vim.o.termguicolors = true
    vim.g.colors_name = "miku"

    -- User styles
    local c_style = opts.styles.comments or { italic = true }
    local k_style = opts.styles.keywords or {}
    local f_style = opts.styles.functions or {}
    local v_style = opts.styles.variables or {}

    -- 🌌 Core UI
    hi("Normal", { fg = p.fg, bg = bg })
    hi("NormalNC", { fg = p.fg2, bg = bg })
    hi("EndOfBuffer", { fg = p.bg, bg = bg }) -- Hides the '~' at end of file
    hi("SignColumn", { bg = bg })

    -- LSP Diagnostics
    hi("DiagnosticUnderlineError", { undercurl = true, sp = p.red })

    -- Semantic Tokens (Neovim 0.9+)
    link("@lsp.type.class", "Type")
    link("@lsp.type.function", "Function")
    link("@lsp.type.variable", "Identifier")

    -- 🔦 Cursors & Selections
    hi("CursorLine", { bg = p.bg_visual })
    hi("CursorLineNr", { fg = p.miku, bold = true })
    hi("LineNr", { fg = p.muted })
    hi("Visual", { bg = p.bg_visual })
    hi("Search", { fg = p.bg, bg = p.yellow, bold = true })
    hi("IncSearch", { fg = p.bg, bg = p.orange, bold = true })

    -- 🪟 Windows, Borders, and Floats (The "Catppuccin" rich UI feel)
    hi("WinSeparator", { fg = p.border })
    hi("VertSplit", { fg = p.border })
    hi("NormalFloat", { fg = p.fg, bg = bg_float })
    hi("FloatBorder", { fg = p.border_focus, bg = bg_float })
    hi("FloatTitle", { fg = p.miku, bg = bg_float, bold = true })

    -- 📋 Popup Menus (Autocomplete)
    hi("Pmenu", { fg = p.fg2, bg = bg_float })
    hi("PmenuSel", { fg = p.bg, bg = p.miku, bold = true })
    hi("PmenuSbar", { bg = bg_dark })
    hi("PmenuThumb", { bg = p.muted })

    -- 🎨 Syntax (Richer mapping)
    hi("Comment", vim.tbl_extend("keep", { fg = p.muted }, c_style))
    hi("Keyword", vim.tbl_extend("keep", { fg = p.purple }, k_style)) -- Swapped to purple for magic
    hi("Function", vim.tbl_extend("keep", { fg = p.miku }, f_style))
    hi("Identifier", vim.tbl_extend("keep", { fg = p.fg }, v_style))

    hi("String", { fg = p.green })
    hi("Number", { fg = p.orange })
    hi("Boolean", { fg = p.pink, bold = true }) -- Pinks make booleans pop!
    hi("Operator", { fg = p.sky })
    hi("Type", { fg = p.sand })
    hi("Constant", { fg = p.pink })
    hi("Special", { fg = p.yellow })
    hi("MatchParen", { fg = p.bg, bg = p.miku, bold = true })

    -- 🐛 Diagnostics
    hi("DiagnosticError", { fg = p.red })
    hi("DiagnosticWarn", { fg = p.orange })
    hi("DiagnosticInfo", { fg = p.sky })
    hi("DiagnosticHint", { fg = p.miku2 })

    hi("DiagnosticVirtualTextError", { fg = p.red, bg = opts.transparent_background and "NONE" or "#2B161B" })
    hi("DiagnosticVirtualTextWarn", { fg = p.orange, bg = opts.transparent_background and "NONE" or "#2B2118" })
    hi("DiagnosticVirtualTextInfo", { fg = p.sky, bg = opts.transparent_background and "NONE" or "#162838" })
    hi("DiagnosticVirtualTextHint", { fg = p.miku2, bg = opts.transparent_background and "NONE" or "#122730" })

    -- 🌿 Git
    hi("GitSignsAdd", { fg = p.green, bg = bg })
    hi("GitSignsChange", { fg = p.sand, bg = bg })
    hi("GitSignsDelete", { fg = p.red, bg = bg })

    -- Dynamically load integrations
    for integration, enabled in pairs(opts.integrations) do
        if enabled then
            local ok, module = pcall(require, "miku.integrations." .. integration)
            if ok and module.apply then
                module.apply(p, opts)
            end
        end
    end

    local telescope = require("miku.integrations.telescope").get(p)
    -- Apply telescope highlights
    for hl, specs in pairs(telescope) do
        hi(hl, specs)
    end

    if type(opts.custom_highlights) == "table" then
        for group, spec in pairs(opts.custom_highlights) do
            hi(group, spec)
        end
    end
end

return M
