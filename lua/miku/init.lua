local M = {}

local config = require("miku.config")
local palette = require("miku.palette")

function M.setup(opts)
    config.setup(opts)
end

function M.load(style)
    if style then
        config.options.style = style
    end
    local current_style = config.options.style
    local p = palette.get_palette(current_style)
    require("miku.theme").apply(p, config.options)
end

function M.colors()
    return palette.get_palette(config.options.style)
end

return M
