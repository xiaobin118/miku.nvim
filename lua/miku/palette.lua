local M = {}

M.palettes = {
    dark = {
        bg = "#1a1b26",      -- Dark background
        bg_highlight = "#292e42",
        fg = "#c0caf5",      -- Light text
        fg_dark = "#a9b1d6",
        gray = "#565f89",    -- Comments
        cyan = "#39c5bb",    -- Miku Cyan (Base)
        blue = "#7aa2f7",
        magenta = "#ff66cc", -- Miku Pink (Accent)
        green = "#9ece6a",
        yellow = "#e0af68",
        red = "#f7768e",
        orange = "#ff9e64",
        border = "#272d43",
    },
    light = {
        bg = "#f4f8fa",      -- Light icy blue background
        bg_highlight = "#e2eef3",
        fg = "#2c3e50",      -- DARK TEXT (Fixes the invisible text issue)
        fg_dark = "#1a252f", -- Darker text for emphasis
        gray = "#748ca0",    -- Darker gray for readable comments
        cyan = "#007a80",    -- Darker Miku Cyan for light mode
        blue = "#005bb5",
        magenta = "#c00060", -- Darker Miku Pink for light mode
        green = "#1a7522",
        yellow = "#9c6b00",
        red = "#c80000",
        orange = "#b34700",
        border = "#d0e0e3",
    }
}

---@param style string "dark" or "light"
function M.get(style)
    return M.palettes[style] or M.palettes.dark
end

return M
