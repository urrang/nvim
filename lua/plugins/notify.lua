local base = require("notify.render.base")

local render_fn = function(bufnr, notif, highlights)
    local namespace = base.namespace()
    notif.message[1] = string.format(" %s: %s", notif.title[1], notif.message[1])

    vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, notif.message)
    vim.api.nvim_buf_set_extmark(bufnr, namespace, 0, 0, {
        hl_group = highlights.icon,
        end_line = #notif.message - 1,
        end_col = #notif.message[#notif.message],
        priority = 50,
    })
end

return {
	"rcarriga/nvim-notify",
	event = "VeryLazy",
	opts = {
		render = render_fn,
        fps = 60,
        timeout = 2000
	},
}