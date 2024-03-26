vim.filetype.add({
	extension = {
		lua = function(path)
			return path:match(".nvim.lua$") and "lua" or "luau"
		end,
	},
})

