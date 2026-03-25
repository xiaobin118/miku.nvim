# miku.nvim

# it is a nvim colorscheme, for Miku ACGN fans

ACGN Miku-inspired colorscheme for Neovim (dark + light).

## Commands

- `:colorscheme miku` (uses configured default style)
- `:MikuColorschemeDark`
- `:MikuColorschemeLight`

## Setup (lazy.nvim)

```lua
{
  "xiaobin118/miku.nvim"
  priority = 1000,
  lazy = false,
  config = function()
    require("miku").setup({ style = "dark" })
    vim.cmd.colorscheme("miku")
  end,
}
```

## Lualine

```lua
local p = require("miku").colors()
require("lualine").setup({
  options = {
    theme = require("miku.integrations.lualine").get_theme(p),
  },
})
```
