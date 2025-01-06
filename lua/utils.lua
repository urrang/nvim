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

return M
