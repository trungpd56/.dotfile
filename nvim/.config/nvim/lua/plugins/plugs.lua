return {
	{
		"okuuva/auto-save.nvim",
		ft = {"python", "yaml"},
		opts = { enabled = true },
		-- keys = { { "<leader>n", ":ASToggle<CR>", desc = "Toggle auto-save" } },
	},
	{ "ckipp01/stylua-nvim", run = "cargo install stylua" },
	{ "tpope/vim-unimpaired" },
	{
		"tpope/vim-fugitive",
		keys = {
			{ "<leader>gs", "<cmd>Git<cr>", desc = "Git status" },
			{ "<leader>ga", "<cmd>Git add .<cr>", desc = "Git add" },
			{ "<leader>gc", "<cmd>Git commit<cr>", desc = "Git commit" },
			{ "<leader>gp", "<cmd>Git push<cr>", desc = "Git push" },
		},
	},
	{ "numToStr/Comment.nvim", opts = {}, lazy = false },
	{ "wellle/targets.vim" },
	{
		"kylechui/nvim-surround",
		version = "*", -- Use for stability; omit to use `main` branch for the latest features
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup({})
		end,
	},
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.3",
		dependencies = { "nvim-lua/plenary.nvim" },
		keys = {
			{ "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Live grep" },
			{ "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find file" },
			{ "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Find buffer" },
			{ "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Help tags" },
		},
	},
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			local configs = require("nvim-treesitter.configs")
			configs.setup({
				ensure_installed = { "python", "lua", "c", "bash" },
				sync_install = false,
				auto_install = true,
				highlight = { enable = true, additional_vim_regex_highlighting = false },
			})
		end,
	},
	{ "nvim-treesitter/nvim-treesitter-context" },
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			vim.cmd.colorscheme("catppuccin-mocha")
		end,
	},
	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v3.x",
		dependencies = {
			-- LSP Support
			{ "neovim/nvim-lspconfig" }, -- Required
			{ "williamboman/mason.nvim" }, -- Optional
			{ "williamboman/mason-lspconfig.nvim" }, -- Optional
			-- Autocompletion
			{ "hrsh7th/nvim-cmp" }, -- Required
			{ "hrsh7th/cmp-nvim-lsp" }, -- Required
			{ "L3MON4D3/LuaSnip" }, -- Required
		},
	},
}
