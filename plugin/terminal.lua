local state = {
    buf = -1,
    win = -1,
}

local function create_floating_window(opts)
    opts = opts or {}
    local width = opts.width or math.floor(vim.o.columns * 0.8)
    local height = opts.height or math.floor(vim.o.lines * 0.8)

    -- Calculate the position to center the window
    local col = math.floor((vim.o.columns - width) / 2)
    local row = math.floor((vim.o.lines - height) / 2)

    -- Create a buffer
    local buf = nil
    if vim.api.nvim_buf_is_valid(opts.buf) then
        buf = opts.buf
    else
        buf = vim.api.nvim_create_buf(false, true) -- No file, scratch buffer
    end

    -- Define window configuration
    local win_config = {
        relative = 'editor',
        width = width,
        height = height,
        col = col,
        row = row,
        style = 'minimal', -- No borders or extra UI elements
        border = OPTS.float_border,
    }

    -- Create the floating window
    local win = vim.api.nvim_open_win(buf, true, win_config)

    return { buf = buf, win = win }
end

local toggle_terminal = function()
    if not vim.api.nvim_win_is_valid(state.win) then
        state = create_floating_window({ buf = state.buf })
        if vim.bo[state.buf].buftype ~= 'terminal' then
            vim.cmd.terminal()
        end
        vim.cmd.startinsert()
        vim.api.nvim_buf_set_keymap(state.buf, 'n', '<Esc>', ':TerminalToggle<cr>', {})
    else
        vim.api.nvim_win_hide(state.win)
    end
end

vim.api.nvim_create_user_command('TerminalToggle', toggle_terminal, {})
vim.keymap.set({ 'n', 't' }, '<C-`>', toggle_terminal)
