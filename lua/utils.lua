local popup = require('plenary.popup')

local M = {}

local get_cmd_output = function(cmd)
    local f = assert(io.popen(cmd, 'r'))
    local s = assert(f:read('*a'))
    f:close()
    s = string.gsub(s, '^%s+', '')
    s = string.gsub(s, '%s+$', '')
    s = string.gsub(s, '[\n\r]+', ' ')
    return s
end

local get_repo_url = function()
    local ok, output = pcall(get_cmd_output, 'git config --get remote.origin.url')
    if ok then
        if output:find('git@') then
            -- Output is git@github.com:<repo>.git
            local repo = output:match('github.com:(.+)%.git')
            return 'https://github.com/' .. repo
        else
            -- Output is https://gitub.com/<repo>.git
            return output:gsub('%.git', '')
        end
    end
end

local get_branch = function()
    local ok, output = pcall(get_cmd_output, 'git branch --show-current')
    if ok then
        return output
    end
end

local is_empty = function(s)
    return s == nil or s == ''
end

local Win_id

local function show_menu(opts, cb)
    -- Send escape key to make sure we're in normal mode
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<esc>', true, false, true), 'x', true)

    local height = 10
    local width = 30
    local borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' }

    Win_id = popup.create(opts, {
        title = 'Open in github',
        highlight = 'OpenInGithub',
        line = math.floor(((vim.o.lines - height) / 2) - 1),
        col = math.floor((vim.o.columns - width) / 2),
        minwidth = width,
        minheight = height,
        borderchars = borderchars,
        callback = cb,
    })

    local bufnr = vim.api.nvim_win_get_buf(Win_id)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'q', '<cmd>lua CLOSE_GITHUB_MENU()<cr>', { silent = false })
end

function CLOSE_GITHUB_MENU()
    vim.api.nvim_win_close(Win_id, true)
end

local function open_link(link)
    if jit.os == 'Windows' then
        os.execute('start ' .. link)
    else
        os.execute('open ' .. link)
    end
end

M.open_in_github = function()
    local repo_url = get_repo_url()
    local branch = get_branch()
    local file_path = string.gsub(vim.api.nvim_buf_get_name(0), vim.loop.cwd(), '')

    if is_empty(repo_url) or is_empty(branch) or is_empty(file_path) then
        return
    end

    local current_line = vim.api.nvim_win_get_cursor(0)[1]

    local line_range = '#L' .. current_line;

    -- If we're in visual mode we should link to the selected range instead of just the current line
    local selection_start = vim.fn.getpos('v')[2]

    if selection_start ~= current_line then
        local range = { selection_start, current_line }
        table.sort(range)
        line_range = '#L' .. range[1] .. '-L' .. range[2]
    end

    local code_url = repo_url .. '/blob/' .. branch .. file_path .. line_range
    local blame_url = repo_url .. '/blame/' .. branch .. file_path .. line_range

    local opts = {
        'Open code',
        'Open blame',
        'Copy code link',
        'Copy blame link'
    }

    local callback = function(_, selected)
        if selected == opts[1] then
            open_link(code_url)
        elseif selected == opts[2] then
            open_link(blame_url)
        elseif selected == opts[3] then
            vim.fn.setreg('+', code_url)
        else
            vim.fn.setreg('+', blame_url)
        end
    end

    show_menu(opts, callback);
end

return M
