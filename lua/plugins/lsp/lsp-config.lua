local M = {}

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

M.capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

M.servers = {
    -- gopls = {},
    -- rust_analyzer = {},

    -- Any useful opts we should pass?
    tsserver = {},
    jsonls = {},
    cssls = {},
    html = {},
    svelte = {},
    angularls = {},
    emmet_ls = {},
    lua_ls = {
        Lua = {
            workspace = { checkThirdParty = false },
            telemetry = { enable = false },
        },
    },
}

M.on_attach = function(_, bufnr)
    local nmap = function(keys, func, desc)
        vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
    end

    nmap('<leader>rn', vim.lsp.buf.rename, 'Rename')
    nmap('<leader>ca', '<cmd>Lspsaga code_action<CR>', 'Code Action')
    nmap('<leader>gp', '<cmd>Lspsaga peek_definition<cr>', 'Peek Definition')
    nmap('gd', vim.lsp.buf.definition, 'Goto Definition')
    nmap('gh', '<cmd>Lspsaga hover_doc<CR>', 'Hover Documentation')
end

return M