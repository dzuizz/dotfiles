return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		event = { "BufReadPost", "BufNewFile" },

		-- Tell lazy.nvim which module to call .setup(opts) on
		main = "nvim-treesitter.configs",

		opts = {
			ensure_installed = { "lua", "markdown", "markdown_inline" },
			highlight = { enable = true },
		},
	},
}
