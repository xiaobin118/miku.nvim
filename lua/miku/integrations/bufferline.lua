local M = {}

local function hi(group, spec)
    vim.api.nvim_set_hl(0, group, spec)
end

function M.apply(p)
    hi("BufferLineFill", { bg = p.bg2 })
    hi("BufferLineBackground", { fg = p.muted, bg = p.bg2 })
    hi("BufferLineBufferSelected", { fg = p.fg, bg = p.bg3, bold = true })
    hi("BufferLineBufferVisible", { fg = p.fg2, bg = p.bg2 })

    hi("BufferLineTabSelected", { fg = p.bg, bg = p.miku, bold = true })
    hi("BufferLineTab", { fg = p.fg2, bg = p.bg2 })

    hi("BufferLineIndicatorSelected", { fg = p.miku, bg = p.bg3 })
    hi("BufferLineSeparator", { fg = p.border, bg = p.bg2 })
    hi("BufferLineSeparatorSelected", { fg = p.border, bg = p.bg3 })
end

return M
