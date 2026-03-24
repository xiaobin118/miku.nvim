local M = {}

local config = require("miku.config")
local palette = require("miku.palette")

local function current_palette()
    if config.options.style == "light" then
        return palette.light
    end
    return palette.dark
end

function M.setup(opts)
    config.setup(opts)
end

function M.load(style)
    if style == "light" or style == "dark" then
        config.options.style = style
    end
    require("miku.theme").apply(current_palette(), config.options)
end

function M.colors()
    return current_palette()
end

return M
