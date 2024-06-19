require("nvim-tree").setup({
		vim.keymap.set("n", "<C-o>", vim.cmd.NvimTreeToggle),
		vim.keymap.set("n", "<C-p>", vim.cmd.NvimTreeFocus),
  sort = {
    sorter = "case_sensitive",
  },
  view = {
    width = 30,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})
