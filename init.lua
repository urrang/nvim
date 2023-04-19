require("config.options")
require("config.lazy")
require("config.keymaps")
require("config.autocmds")

-- Enable telescope fzf native, if installed
pcall(require('telescope').load_extension, 'fzf')

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
