OPTS = {
    float_border = vim.g.neovide and 'none' or 'rounded',
    winblend = vim.g.neovide and 10 or 0,
}

if vim.g.vscode then
    require('vscode_config.vscode')
else
    require('config.options')
    require('config.lazy')
    require('config.keymaps')
    require('config.autocmds')
    if vim.g.neovide then
        require('neovide')
    end
end
