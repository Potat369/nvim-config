local Config = require("lazy.core.config")
local Plugin = require("lazy.core.plugin")
local debug = require("debug")

return {
	"j-hui/fidget.nvim",
	priority = 999,
	opts = function()
		--------------------| lazy patch |--------------------

		---@param changes {file:string, what:string}[]
		---@diagnostic disable-next-line: duplicate-set-field
		require("lazy.manage.reloader").reload = function(changes)
			vim.schedule(function()
				if Config.options.change_detection.notify and not Config.headless() then
					for _, change in ipairs(changes) do
						vim.notify(
							change.what .. " " .. vim.fn.fnamemodify(change.file, ":t"),
							nil,
							{ group = "lazy.nvim", annote = "lazy.nvim" }
						)
					end
				end
				Plugin.load()
				vim.api.nvim_exec_autocmds("User", { pattern = "LazyRender", modeline = false })
				vim.api.nvim_exec_autocmds("User", { pattern = "LazyReload", modeline = false })
			end)
		end

		--------------------| core patch |--------------------

		local comment = require("vim._comment")
		local _, get_comment_parts = debug.getupvalue(comment.toggle_lines, 1)
		local _, get_commentstring = debug.getupvalue(get_comment_parts, 1)
		local patched_get_comment_parts = function(ref_position)
			local cs = get_commentstring(ref_position)

			if cs == nil or cs == "" then
				vim.notify("Option 'commentstring' is empty.", vim.log.levels.WARN)
				return { left = "", right = "" }
			end

			if not (type(cs) == "string" and cs:find("%%s") ~= nil) then
				error(vim.inspect(cs) .. " is not a valid 'commentstring'.")
			end

			-- Structure of 'commentstring': <left part> <%s> <right part>
			local left, right = cs:match("^(.-)%%s(.-)$")
			assert(left and right)
			return { left = left, right = right }
		end
		debug.setupvalue(comment.toggle_lines, 1, patched_get_comment_parts)
		debug.setupvalue(comment.textobject, 1, patched_get_comment_parts)

		--------------------| configuration |--------------------

		require("fidget").setup({
			notification = {
				override_vim_notify = true,
				configs = {
					default = vim.tbl_deep_extend("force", require("fidget.notification").default_config, {
						icon = "",
					}),
				},
			},
		})
	end,
}
