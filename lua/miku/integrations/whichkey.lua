local M = {}

local function hi(group, spec)
    vim.api.nvim_set_hl(0, group, spec)
end

function M.apply(p)
    hi("WhichKey", { fg = p.miku, bold = true })
    hi("WhichKeyGroup", { fg = p.sky })
    hi("WhichKeyDesc", { fg = p.fg2 })
    hi("WhichKeySeparator", { fg = p.muted })
    hi("WhichKeyFloat", { bg = p.bg2 })
    hi("WhichKeyBorder", { fg = p.border, bg = p.bg2 })
end

return M
