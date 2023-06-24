require("lspconfig")["lua_ls"].setup({
	Lua = {
		completion = {
			callSnippet = "Both",
			keywordSnippet = "Both",
		},
		diagnostics = {
			disable = { "unused-vararg", "different-requires" },
			enable = true,
			globals = { "describe", "it", "before_each", "after_each" },
		},
		runtime = {
			version = "LuaJIT",
		},
		telemetry = {
			enable = false,
		},
		workspace = {
			library = {
				["/Users/joaovfsousa/.local/share/lunarvim"] = true,
			},
			maxPreload = 100000,
			preloadFileSize = 10000,
		},
	},
})
