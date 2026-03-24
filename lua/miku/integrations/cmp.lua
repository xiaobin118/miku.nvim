local M = {}

local function hi(group, spec)
    vim.api.nvim_set_hl(0, group, spec)
end

function M.apply(p)
    hi("CmpItemAbbr", { fg = p.fg2 })
    hi("CmpItemAbbrMatch", { fg = p.miku, bold = true })
    hi("CmpItemAbbrMatchFuzzy", { fg = p.miku2, bold = true })

    hi("CmpItemKindFunction", { fg = p.miku })
    hi("CmpItemKindMethod", { fg = p.miku })
    hi("CmpItemKindVariable", { fg = p.fg2 })
    hi("CmpItemKindField", { fg = p.fg2 })
    hi("CmpItemKindKeyword", { fg = p.sky })
    hi("CmpItemKindSnippet", { fg = p.yellow })
    hi("CmpItemKindText", { fg = p.fg2 })
    hi("CmpItemKindClass", { fg = p.purple })
    hi("CmpItemKindInterface", { fg = p.purple })
    hi("CmpItemKindModule", { fg = p.sand })
end

return M
