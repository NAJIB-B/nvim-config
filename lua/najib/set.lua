vim.opt.guicursor = ""

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4

vim.opt.smartindent = true

vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.updatetime = 50

-- Function to set tab width
local function set_tab_width()
  vim.bo.shiftwidth = 2
  vim.bo.tabstop = 2
  vim.bo.expandtab = true
end

-- Autocommand to apply the settings for JavaScript files
vim.api.nvim_create_autocmd("FileType", {
  pattern = "javascript",
  callback = set_tab_width,
})
