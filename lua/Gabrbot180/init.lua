require("Gabrbot180.remap")

print("Hello from Gabrbot180")
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true
vim.opt.scrolloff = 8

local is_mac = vim.fn.has("macunix") == 1
local is_wsl = vim.env.WSL_DISTRO_NAME ~= nil or vim.env.WSL_INTEROP ~=nil
if is_wsl then
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
elseif is_mac then
    vim.api.nvim_exec2([[
        let g:clipboard = "pbcopy"
    ]], {})
else
    vim.api.nvim_exec2([[
        let g:clipboard = "tmux"
    ]], {})
end
