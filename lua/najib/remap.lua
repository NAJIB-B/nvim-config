vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<leader>q", vim.cmd.q)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv") 
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv") 

vim.keymap.set('v', 'm', function()
  vim.cmd('normal! y')
  vim.cmd('normal! `]')
  vim.cmd('normal! o')
  vim.cmd('normal! p')
end, { noremap = true, silent = true })

vim.keymap.set('n', 'm', function()
		vim.cmd('normal! k')
		vim.cmd('normal! o')
		vim.cmd('normal! k')
		vim.cmd('normal! p')
end, { noremap = true, silent = true })


--for buffers
vim.keymap.set("n", "[", vim.cmd.bprevious)
vim.keymap.set("n", "]", vim.cmd.bnext)
vim.keymap.set("n", "<leader>bd", vim.cmd.bdelete)

--for windows
vim.keymap.set("n", "<leader>w", vim.cmd.vsp)
vim.keymap.set("n", "<leader>nn", "<C-w><C-w>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>c", vim.cmd.close)

--for debuggers
vim.keymap.set("n", "<leader>db", "<cmd>DapToggleBreakpoint<CR>")
vim.keymap.set("n", "<leader>dr", "<cmd>DapContinue<CR>")
