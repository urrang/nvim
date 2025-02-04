local M = {}

local get_cmd_output = function(cmd)
    local process = io.popen(cmd, 'r')
    if process ~= nil then
        local output = process:read('*a')
        process:close()
        return output:match('^%s*(.-)%s*$'):gsub('[\n\r]+', ' ')
    end
end

local get_repo_url = function()
    local ok, output = pcall(get_cmd_output, 'git config --get remote.origin.url')
    if not ok then
        return ''
    end

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
    local branch = get_cmd_output('git branch --show-current')
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

return M
