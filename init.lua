if vim.g.vscode then
    require('vscode_config.vscode')
else
    require('config.options')
    require('config.lazy')
    require('config.keymaps')
    require('config.autocmds')
end
