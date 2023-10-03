if vim.g.vscode then
	require('vscode.vscode')
else
	require('config.options')
	require('config.lazy')
	require('config.keymaps')
	require('config.autocmds')
end
