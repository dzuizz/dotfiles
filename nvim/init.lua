vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.smartindent = true
vim.opt.autoindent = true

vim.opt.number = true
vim.opt.relativenumber = true

vim.keymap.set("n", "<Esc>", "<cmd>noh<CR>", { desc = "Clear search highlight" })

local jinja_plugin = "/opt/homebrew/lib/node_modules/prettier-plugin-jinja-template/lib/index.js"
vim.opt.autoread = true
vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = { "*.html", "*.css", "*.js", "*.ts", "*.json", "*.md", "*.yaml", "*.yml", "*.jinja", "*.j2" },
  callback = function(a)
    if vim.fn.executable("prettier") ~= 1 then return end
    local cmd = { "prettier", "--write", a.file }
    if a.file:match("%.jinja$") or a.file:match("%.j2$") then
      cmd = { "prettier", "--plugin=" .. jinja_plugin, "--parser=jinja-template", "--write", a.file }
    end
    vim.system(cmd, {}, function()
      vim.schedule(function() vim.cmd("checktime") end)
    end)
  end,
})
