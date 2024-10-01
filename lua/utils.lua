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

M.open_in_github = function()
    local repo_url = get_repo_url()
    local branch = get_branch()
    local file_path = string.gsub(vim.api.nvim_buf_get_name(0), vim.loop.cwd(), '')

    if is_empty(repo_url) or is_empty(branch) or is_empty(file_path) then
        return
    end

    local url = repo_url .. '/blob/' .. branch .. file_path

    local current_line = vim.api.nvim_win_get_cursor(0)[1]

    -- If we're in visual mode we should link to the selected range instead of just the current line
    local selection_start = vim.fn.getpos('v')[2]

    if selection_start ~= current_line then
        local range = { selection_start, current_line }
        table.sort(range)
        url = url .. '#L' .. range[1] .. '-L' .. range[2]
    else
        url = url .. '#L' .. current_line
    end

    if jit.os == 'Windows' then
        os.execute('start ' .. url)
    else
        os.execute('open ' .. url)
    end
end

return M
