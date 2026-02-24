vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- convenience
vim.keymap.set("n", "<leader>q", "<cmd>q<cr>", { desc = "Quit" })
vim.keymap.set("n", "<leader>w", "<cmd>w<cr>", { desc = "Write" })

-- Lazygit
vim.keymap.set("n", "<leader>gg", "<cmd>LazyGit<cr>", { desc = "LazyGit" })

-- Obsidian vault keys (work in markdown)
vim.keymap.set("n", "<leader>nn", "<cmd>ObsidianNew<cr>", { desc = "New note" })
vim.keymap.set("n", "<leader>nd", "<cmd>ObsidianToday<cr>", { desc = "Daily note" })
vim.keymap.set("n", "<leader>nb", "<cmd>ObsidianBacklinks<cr>", { desc = "Backlinks" })
vim.keymap.set("n", "<leader>nf", "<cmd>ObsidianSearch<cr>", { desc = "Search vault" })
vim.keymap.set("n", "<leader>nt", "<cmd>ObsidianTags<cr>", { desc = "Tags" })
vim.keymap.set("n", "<leader>nr", "<cmd>ObsidianRename<cr>", { desc = "Rename note" })
