local M = {}

local palettes = {
    dark = {
        -- 🌌 Backgrounds (Deep Night Sky)
        bg           = "#0A141F", -- Main editor background
        bg_dark      = "#060D14", -- Darker background (Sidebars, NvimTree)
        bg_float     = "#0E1D2D", -- Floating windows (Pmenu, Telescope)
        bg_visual    = "#16334D", -- Visual selection highlight

        -- Keep aliases for backwards compatibility with your integrations
        bg2          = "#0E1D2D",
        bg3          = "#16334D",

        -- ☁️ Foregrounds (Starlight & Clouds)
        fg           = "#E0EEF8", -- Main text (Bright Starlight)
        fg2          = "#B1CDE0", -- Dimmed text
        muted        = "#68849E", -- Comments, indent lines (Dark Cloud)

        -- 🩵 Miku Accents (Hair & Sky)
        miku         = "#39E5E6", -- Vibrant Hair Cyan (Primary Accent)
        miku2        = "#1AA6C8", -- Deep Hair Teal
        sky          = "#5CB3FF", -- Night Sky Blue
        cloud        = "#A6D5F2", -- Soft Cloud Blue

        -- 🌻 Warm Accents (Hat, Flowers, Blush)
        sand         = "#E6D3A3", -- Straw Hat Beige
        yellow       = "#FAD36F", -- Flower Yellow
        orange       = "#F4A261", -- Sunset Orange
        pink         = "#F794A8", -- Miku Blush / Soft Pink

        -- 🎨 Syntax & Diagnostics
        red          = "#FA6E83", -- Errors / Deletions
        green        = "#7BE5A9", -- Success / Additions / Strings
        purple       = "#C2A3FF", -- Keywords / Magic

        -- 🪟 Borders
        border       = "#1C3651", -- Unfocused UI borders
        border_focus = "#39E5E6", -- Focused UI borders (Miku Cyan)
    },

    light = {
        -- ⛅ Backgrounds (Daylight Sky)
        bg           = "#F0F8FF", -- Main editor background (Bright Sky)
        bg_dark      = "#E4F2FA", -- Darker background (Sidebars)
        bg_float     = "#FFFFFF", -- Floating windows (Pure White Cloud)
        bg_visual    = "#D1E9F6", -- Visual selection

        bg2          = "#FFFFFF",
        bg3          = "#D1E9F6",

        -- 👤 Foregrounds (Deep Ocean)
        fg           = "#102A3D", -- Main text
        fg2          = "#264F6B", -- Dimmed text
        muted        = "#5A86A3", -- Comments

        -- 🩵 Miku Accents
        miku         = "#0DB4B8", -- Hair Cyan
        miku2        = "#088399", -- Deep Teal
        sky          = "#1F8CE6", -- Vivid Sky Blue
        cloud        = "#7AAED1", -- Darker Cloud

        -- 🌻 Warm Accents
        sand         = "#B89D4B", -- Straw Hat Beige
        yellow       = "#D19600", -- Flower Yellow
        orange       = "#C46521", -- Warm Orange
        pink         = "#D64C69", -- Blush Pink

        -- 🎨 Syntax & Diagnostics
        red          = "#D92D4E",
        green        = "#13966E",
        purple       = "#7E66DE",

        -- 🪟 Borders
        border       = "#C5E1F2",
        border_focus = "#0DB4B8",
    }
}

function M.get_palette(style)
    local config = require("miku.config").options
    local palette = vim.deepcopy(palettes[style])

    if config.color_overrides and config.color_overrides[style] then
        palette = vim.tbl_extend("force", palette, config.color_overrides[style])
    end

    return palette
end

return M
