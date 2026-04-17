local checking_interval_seconds = 30
local close_after_minutes = 20
local ignored_filetypes = { 'lazy' }

local function option_value(opt, bufnr)
    return vim.api.nvim_get_option_value(opt, { buf = bufnr })
end

local function check_buffers()
    local open_buffers = vim.fn.getbufinfo({ buflisted = 1 })

    if #open_buffers < 2 then
        return
    end

    local quickfix_buffers = {}
    for _, entry in ipairs(vim.fn.getqflist()) do
        quickfix_buffers[entry.bufnr] = true
    end

    for _, buf in ipairs(open_buffers) do
        local used_secs_ago = os.time() - buf.lastused
        local recently_used = used_secs_ago < close_after_minutes * 60

        local filetype = option_value('filetype', buf.bufnr)
        local is_modified = option_value('modified', buf.bufnr)
        local is_special_buffer = option_value('buftype', buf.bufnr) ~= ''
        local is_alt_file = buf.name == vim.fn.expand('#:p')
        local is_visible_buf = buf.hidden == 0 and buf.loaded == 1

        if
            recently_used
            or quickfix_buffers[buf.bufnr] == true
            or vim.tbl_contains(ignored_filetypes, filetype)
            or is_modified
            or is_special_buffer
            or is_alt_file
            or is_visible_buf
        then
            goto continue
        end

        vim.api.nvim_buf_delete(buf.bufnr, { force = false, unload = false })
        ::continue::
    end
end

local timer = assert(vim.uv.new_timer(), 'Timer creation failed.')
timer:start(close_after_minutes * 60000, checking_interval_seconds * 1000, vim.schedule_wrap(check_buffers))
