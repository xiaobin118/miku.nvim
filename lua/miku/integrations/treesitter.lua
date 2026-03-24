local M = {}

local function link(group, target)
    vim.api.nvim_set_hl(0, group, { link = target })
end

function M.apply(_p)
    link("@punctuation.delimiter", "Operator")
    link("@punctuation.bracket", "Operator")
    link("@property", "Identifier")
    link("@parameter", "Identifier")
    link("@type.builtin", "Type")
    link("@function.builtin", "Function")
    link("@keyword.return", "Keyword")
end

return M
