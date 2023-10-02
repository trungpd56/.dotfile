local augroup = vim.api.nvim_create_augroup
local mygroup = augroup("mygroup", { clear = True })
local mytype = augroup("mypython", { clear = True })
local yank_group = augroup("HighlightYank", { clear = True })

local autocmd = vim.api.nvim_create_autocmd

autocmd("TextYankPost", {
	group = yank_group,
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({
			higroup = "IncSearch",
			timeout = 40,
		})
	end,
})

autocmd({ "BufWritePre" }, {
	group = mygroup,
	pattern = "*",
	command = [[%s/\s\+$//e]],
})

autocmd("FileType", {
	group = mytype,
	pattern = "python",
	callback = function()
		vim.keymap.set("n", "<f9>", ":w<cr>:!python3 %<cr>")
		vim.keymap.set({ "n", "i" }, "<f8>", "<esc>:w<cr>:!pytest -s<cr>")
		vim.keymap.set("n", "<leader>fm", "<cmd>:%!black - -q<Cr>", { silent = true })
		vim.keymap.set("n", "<leader>b", "obreakpoint()<esc>")
	end,
})

autocmd("FileType", {
	group = mytype,
	pattern = "lua",
	callback = function()
		vim.keymap.set("n", "<leader>fm", [[<cmd>lua require("stylua-nvim").format_file()<CR>]], { silent = true })
	end,
})

autocmd("FileType", {
	group = mytype,
	pattern = "sh",
	callback = function()
		vim.keymap.set("n", "<leader>fm", [[<cmd>:%!shfmt -i 2<CR>]], { silent = true })
	end,
})
-- Terminal Setting
-- Open a Terminal on the right tab
-- autocmd('CmdlineEnter', {
--   command = 'command! Term :botright vsplit term://$SHELL'
-- })

-- Enter insert mode when switching to terminal
autocmd('TermOpen', {
  command = 'setlocal listchars= nonumber norelativenumber nocursorline',
})
autocmd('TermOpen', {
  pattern = '',
  command = 'startinsert'
})

-- Close terminal buffer on process exit
autocmd('BufLeave', {
  pattern = 'term://*',
  command = 'stopinsert'
})

