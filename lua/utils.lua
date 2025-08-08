local M = {}

local get_cmd_output = function(cmd)
    local process = io.popen(cmd, 'r')
    if process ~= nil then
        local output = process:read('*a')
        process:close()
        return output
    end
end

local get_repo_url = function()
    local cmd = 'git config --get remote.origin.url'
    local output = get_cmd_output(cmd):match('^%s*(.-)%s*$'):gsub('[\n\r]+', ' ')

    if output:find('git@') then
        -- Repo url is git@github.com:<repo>.git
        local repo = output:match('github.com:(.+)%.git')
        return 'https://github.com/' .. repo
    else
        -- Repo url is https://gitub.com/<repo>.git
        return output:gsub('%.git', '')
    end
end

M.open_in_github = function(blame)
    local repo_url = get_repo_url()
    local cmd = 'git branch --show-current'
    local branch = get_cmd_output(cmd):match('^%s*(.-)%s*$'):gsub('[\n\r]+', ' ')

    local file_path = string.gsub(vim.api.nvim_buf_get_name(0), vim.loop.cwd(), '')

    if repo_url == '' or file_path == '' then
        return
    end

    local current_line = vim.api.nvim_win_get_cursor(0)[1]
    local selection_start = vim.fn.getpos('v')[2]

    local line_range = '#L' .. current_line

    if selection_start ~= current_line then
        local range = { selection_start, current_line }
        table.sort(range)
        line_range = '#L' .. range[1] .. '-L' .. range[2]
    end

    local url = repo_url .. (blame and '/blame/' or '/blob/' .. branch .. file_path .. line_range)

    if jit.os == 'Windows' then
        os.execute('start ' .. url)
    else
        os.execute('open ' .. url)
    end
end

local function find_node_ancestor(types, node)
    if not node then
        return nil
    end

    if vim.tbl_contains(types, node:type()) then
        return node
    end

    local parent = node:parent()

    return find_node_ancestor(types, parent)
end

-- When typing "await" add "async" to the function declaration if it doesn't already exist
M.auto_await = function()
    vim.api.nvim_feedkeys('t', 'n', true)

    local text_before_cursor = vim.fn.getline('.'):sub(vim.fn.col('.') - 4, vim.fn.col('.') - 1)
    if text_before_cursor ~= 'awai' then
        return
    end

    local current_node = vim.treesitter.get_node({ ignore_injections = false })
    local function_node = find_node_ancestor({ 'arrow_function', 'function_declaration', 'function' }, current_node)
    if not function_node then
        return
    end

    local function_text = vim.treesitter.get_node_text(function_node, 0)
    if vim.startswith(function_text, 'async ') then
        return
    end

    local start_row, start_col = function_node:start()
    vim.api.nvim_buf_set_text(0, start_row, start_col, start_row, start_col, { 'async ' })
end

M.git_blame = function()
    local linenr = vim.api.nvim_win_get_cursor(0)[1]

    -- Run git blame on the current line
    local cmd = string.format('git blame -L %d,%d --porcelain %s', linenr, linenr, vim.fn.expand('%'))
    local output = get_cmd_output(cmd)

    -- Parse author and summary
    local author = output:match('author (.-)\n') or 'Unknown'
    local summary = output:match('summary (.-)\n') or 'No summary'
    local time = output:match('author%-time (%d+)')
    local date = time and os.date('%Y-%m-%d %H:%M:%S', tonumber(time)) or 'Unknown date'

    local blame_text = string.format('%s (%s)\n%s', author, date, summary)

    -- Create buffer, set text and add highlight
    local buf = vim.api.nvim_create_buf(false, true)
    vim.api.nvim_buf_set_lines(buf, 0, -1, false, vim.split(blame_text, '\n'))

    vim.api.nvim_buf_add_highlight(buf, -1, 'GitBlameAuthor', 0, 0, #author)
    vim.api.nvim_buf_add_highlight(buf, -1, 'GitBlameDate', 0, #author, #author + #date + 3)

    vim.api.nvim_set_hl(0, 'GitBlameAuthor', { link = 'Title' })
    vim.api.nvim_set_hl(0, 'GitBlameDate', { link = 'Comment' })

    -- Open floating window
    local win = vim.api.nvim_open_win(buf, true, {
        relative = 'cursor',
        width = math.min(summary:len(), 80),
        height = 2,
        col = 1,
        row = 1,
        style = 'minimal',
        border = OPTS.float_border,
    })

    local close_win = function()
        if vim.api.nvim_win_is_valid(win) then
            vim.api.nvim_win_close(win, true)
        end
    end

    vim.keymap.set('n', 'q', close_win, { buffer = buf })
    vim.keymap.set('n', '<Esc>', close_win, { buffer = buf })
end

return M
