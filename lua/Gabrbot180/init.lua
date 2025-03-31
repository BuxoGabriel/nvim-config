require("Gabrbot180.remap")

print("Hello from Gabrbot180")
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true
vim.opt.scrolloff = 8

vim.api.nvim_exec2([[
    let g:clipboard = {
    \    'name': 'WslClipboard',
    \    'copy': {
    \        '+': 'clip.exe',
    \        '*': 'clip.exe',
    \    },
    \    'paste': {
    \       '+': 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
    \       '*': 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
    \    },
    \    'cache_enabled': 0,
    \}
]], {})
