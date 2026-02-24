return {
	{
		"epwalsh/obsidian.nvim",
		version = "*",
		cmd = {
			"ObsidianNew",
			"ObsidianToday",
			"ObsidianSearch",
			"ObsidianTags",
			"ObsidianBacklinks",
			"ObsidianRename",
			"ObsidianOpen",
			"ObsidianFollowLink",
		},

		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
		},
		opts = function()
			local VAULT = vim.fn.expand("~/vault") -- CHANGE THIS

			return {
				dir = VAULT,
				notes_subdir = "notes",
				daily_notes = { folder = "daily" },

				preferred_link_style = "wiki",

				picker = { name = "telescope.nvim" },

				completion = {
					nvim_cmp = true,
					min_chars = 2,
				},

				note_id_func = function(title)
					local suffix = ""
					if title and title ~= "" then
						suffix = title:gsub("%s+", "-"):gsub("[^%w%-]", ""):lower()
					end
					return os.date("%Y%m%d%H%M") .. (suffix ~= "" and "-" .. suffix or "")
				end,
			}
		end,
		keys = {
			{ "<leader>nn", "<cmd>ObsidianNew<cr>", desc = "New note" },
			{ "<leader>nd", "<cmd>ObsidianToday<cr>", desc = "Daily note" },
			{ "<leader>nf", "<cmd>ObsidianSearch<cr>", desc = "Search vault" },
			{ "<leader>nt", "<cmd>ObsidianTags<cr>", desc = "Tags" },
			{ "<leader>nb", "<cmd>ObsidianBacklinks<cr>", desc = "Backlinks" },
			{ "<leader>nr", "<cmd>ObsidianRename<cr>", desc = "Rename note" },
		},
	},
}
