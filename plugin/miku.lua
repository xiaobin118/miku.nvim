if vim.g.loaded_miku_colorscheme == 1 then
    return
end
vim.g.loaded_miku_colorscheme = 1

vim.api.nvim_create_user_command("MikuColorschemeDark", function()
    require("miku").load("dark")
end, {})

vim.api.nvim_create_user_command("MikuColorschemeLight", function()
    require("miku").load("light")
end, {})
