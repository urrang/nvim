return {
	"folke/noice.nvim",
	config = function()
		require("noice").setup({
			-- add any options here
			lsp_doc_border = true
		})
	end,
	dependencies = {
		-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
		"MunifTanjim/nui.nvim",
		-- OPTIONAL:
		--   `nvim-notify` is only needed, if you want to use the notification view.
		--   If not available, we use `mini` as the fallback
		"rcarriga/nvim-notify",
	}
}

-- return {
-- 	"rcarriga/nvim-notify",
-- 	config = function()
-- 		local notify = require("notify")
-- 		vim.notify = notify
-- 		print = function(...)
-- 			local print_safe_args = {}
-- 			local _ = { ... }
-- 			for i = 1, #_ do
-- 				table.insert(print_safe_args, tostring(_[i]))
-- 			end
-- 			notify(table.concat(print_safe_args, ' '), "info")
-- 		end
-- 		notify.setup()
-- 	end
-- }