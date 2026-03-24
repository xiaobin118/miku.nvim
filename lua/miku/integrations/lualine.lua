local M = {}

function M.get_theme(p)
    return {
        normal = {
            a = { fg = p.bg, bg = p.miku, gui = "bold" },
            b = { fg = p.fg2, bg = p.bg2 },
            c = { fg = p.fg2, bg = p.bg },
        },
        insert = { a = { fg = p.bg, bg = p.sky, gui = "bold" } },
        visual = { a = { fg = p.bg, bg = p.purple, gui = "bold" } },
        replace = { a = { fg = p.bg, bg = p.red, gui = "bold" } },
        inactive = {
            a = { fg = p.muted, bg = p.bg2 },
            b = { fg = p.muted, bg = p.bg2 },
            c = { fg = p.muted, bg = p.bg },
        },
    }
end

return M
