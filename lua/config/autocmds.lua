-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })

vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

vim.api.nvim_create_autocmd('BufWinEnter', {
  pattern = '*',
  callback = function(event)
    if vim.bo[event.buf].filetype == 'help' then vim.cmd.only() end
  end,
})

vim.api.nvim_create_autocmd('CursorHold', {
  callback = function()
    local opts = {
      focusable = false,
      close_events = { 'BufLeave', 'CursorMoved', 'InsertEnter' },
      border = 'rounded',
      -- source = 'always',
      -- prefix = ' ',
      scope = 'cursor',
    }
    vim.diagnostic.open_float(nil, opts)
  end,
})

-- vim.api.nvim_create_autocmd('UIEnter', {
--   callback = function()
--     if vim.bo.filetype ~= '' then -- Check if the buffer has a filetype
--       return
--     end
--     -- If it doesn't we check if it's empty
--     if vim.api.nvim_buf_get_lines(0, 0, -1, false)[1] == '' then
--       vim.cmd('Alpha')
--       -- vim.cmd('SessionRestore')
--     end
--   end,
-- })
