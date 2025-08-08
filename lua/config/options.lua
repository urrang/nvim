vim.o.cmdheight = 0
vim.o.pumheight = 15 -- max number of items in popup menus
vim.o.cursorline = true

vim.o.scrolloff = 5
vim.o.sidescrolloff = 5

vim.wo.wrap = false

vim.o.laststatus = 3 -- status line full width

vim.wo.number = true
vim.wo.relativenumber = true

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

vim.opt.autoread = true

vim.opt.splitright = true
vim.opt.splitbelow = true

-- Enable mouse mode
vim.o.mouse = 'a'

-- Sync clipboard between OS and Neovim.
vim.o.clipboard = 'unnamedplus'

-- Enable break indent
-- vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.wo.signcolumn = 'yes'

-- Decrease update time
vim.o.updatetime = 250
vim.o.timeout = true
vim.o.timeoutlen = 300

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

vim.o.termguicolors = true

-- vim.opt.autoindent = true
-- vim.opt.smartindent = true

vim.diagnostic.config({
    severity_sort = true,
    float = { border = OPTS.float_border },
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = '󰅚 ',
            [vim.diagnostic.severity.WARN] = '󰀪 ',
            [vim.diagnostic.severity.INFO] = '󰋽 ',
            [vim.diagnostic.severity.HINT] = '󰌶 ',
        },
    },
    virtual_text = {
        source = 'if_many',
        spacing = 2,
        format = function(diagnostic)
            local s = vim.diagnostic.severity
            if diagnostic.severity == s.ERROR or diagnostic.severity == s.WARN then
                return diagnostic.message
            end
        end,
    },
})

vim.filetype.add({
    extension = {
        mdx = 'markdown',
    },
})

-- Open help in tab instead of buffer
vim.cmd('ca help tab help')
vim.cmd('ca h tab h')

-- Correct common typos
vim.api.nvim_create_user_command('Wa', 'wa', {})
vim.api.nvim_create_user_command('WA', 'wa', {})
vim.api.nvim_create_user_command('Wq', 'wq', {})
vim.api.nvim_create_user_command('WQ', 'wq', {})

-- LSP
vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = {
        severity = { min = vim.diagnostic.severity.WARN },
    },
})

-- Add border to floating windows (https://github.com/neovim/neovim/issues/32242)
local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview

function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
    opts = opts or {}
    opts.border = OPTS.float_border
    return orig_util_open_floating_preview(contents, syntax, opts, ...)
end

-- vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, {
--     border = OPTS.float_border,
-- })

vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, {
    -- border = OPTS.float_border,
    silent = true,
    focusable = false,
})
