local vim = vim
vim.loader.enable()
-- Cursor
vim.opt.guicursor = "n-v-i-c:block-Cursor"

-- Text
vim.opt.shell = "zsh"
vim.opt.shellcmdflag = "-l -c"
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.scrolloff = 8
vim.opt.signcolumn = "no"
vim.opt.fillchars = { eob = " " }
vim.opt.wrap = false

-- UI
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorcolumn = false
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.termguicolors = true
vim.opt.winborder = "rounded"

-- Undo history
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = vim.fn.expand("~/.config/nvim/.undo/")
vim.opt.undofile = true

-- Loading plugins
vim.pack.add({
	{ src = "https://github.com/rose-pine/neovim" },
	{ src = "https://github.com/folke/tokyonight.nvim" },
	{ src = "https://github.com/MunifTanjim/nui.nvim" },
	{ src = "https://github.com/folke/noice.nvim" },
	{ src = "https://github.com/mason-org/mason.nvim" },
	{ src = "https://github.com/stevearc/oil.nvim" },
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/mbbill/undotree" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "master" },
	{ src = "https://github.com/folke/snacks.nvim" },
	{ src = "https://github.com/nvim-mini/mini.nvim" },
	{ src = "https://github.com/Myriad-Dreamin/tinymist" },
	{ src = "https://github.com/chomosuke/typst-preview.nvim" },
	{ src = "https://github.com/stevearc/conform.nvim" },
	{ src = "https://github.com/saghen/blink.cmp", version = vim.version.range("1.*") },
	{ src = "https://github.com/rafamadriz/friendly-snippets" },
	{ src = "https://github.com/quarto-dev/quarto-nvim" },
	{ src = "https://github.com/jmbuhr/otter.nvim" },
})

-- Setting the colorscheme
require("rose-pine").setup({
	variant = "moon",
	styles = {
		transparency = true,
	},
	highlight_groups = {
		Cursor = { bg = "text" },
		Visual = { bg = "highlight_high", inherit = false },
	},
})

require("tokyonight").setup({
	transparent = true,
	styles = {
		sidebars = "transparent",
		floats = "transparent",
	},
	on_highlights = function(hl)
		hl.Visual = { bg = "#828bb8" }
		hl.LineNr = { fg = "#828bb8" }
		hl.LineNrAbove = { fg = "#828bb8" }
		hl.LineNrBelow = { fg = "#828bb8" }
		hl.SnacksPickerInputBorder = { fg = "#828bb8" }
	end,
})
vim.cmd("colorscheme tokyonight-moon")
vim.api.nvim_set_hl(0, "StatusLine", { bg = "none" })
vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none" })
vim.api.nvim_set_hl(0, "Search", { bg = "none", fg = "#88c0d0" })

-- Setting up the LSP
require("mason").setup()
require("nvim-treesitter.configs").setup({
	ensure_installed = { "lua", "python", "regex" },
	auto_install = true,
	highlight = { enable = true },
})
vim.lsp.enable({ "lua_ls", "ruff", "ty", "tinymist" })
vim.lsp.config["tinymist"] = {
	settings = {
		formatterMode = "typstyle",
		formatterProseWrap = true,
		formatterPrintWidth = 80,
		formatterIndentSize = 2,
	},
}
require("blink.cmp").setup()
require("conform").setup({
	formatters_by_ft = {
		quarto = { "injected" },
		lua = { "stylua" },
		python = { "ruff_format", "ruff_organize_imports" },
		typst = { "typstyle" },
		json = { "prettier" },
	},
})
require("quarto").setup()
vim.diagnostic.config({
	virtual_text = true,
	signs = true,
})

-- Setting up other plugins
require("oil").setup({
	view_options = { show_hidden = true },
})
require("mini.surround").setup()
require("mini.pairs").setup()
require("mini.icons").setup()
require("mini.comment").setup()
require("noice").setup({
	lsp = {
		hover = {
			opts = { border = "rounded" },
		},
	},
})
local Snacks = require("snacks")
Snacks.setup({
	bigfile = { enabled = true },
	indent = { enabled = true },
	picker = { enabled = true },
	terminal = { enabled = true, win = { border = "rounded" } },
	dim = { enabled = true },
	toggle = { enabled = true },
})
require("typst-preview").setup()

-- Keybinds
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>r", ":update<CR> :restart<CR>")
vim.keymap.set("n", "<leader>-", ":Oil --float<CR>")

vim.keymap.set("n", "<leader>=", require("conform").format)

-- stylua: ignore start
vim.keymap.set("n", "<leader>ff", function() Snacks.picker.files({ hidden = true }) end)
vim.keymap.set("n", "<leader>fh", function() Snacks.picker.help() end)
vim.keymap.set("n", "<leader>fg", function() Snacks.picker.grep() end)
vim.keymap.set("n", "<leader>fr", function() Snacks.picker.recent() end)
vim.keymap.set("n", "<leader>fd", function() Snacks.picker.diagnostics() end)
vim.keymap.set("n", "<leader>t", function() Snacks.terminal.toggle(vim.o.shell) end)
vim.keymap.set("n", "<leader>.", function() Snacks.toggle.dim():toggle() end)
vim.keymap.set("n", "<leader>fu", function() Snacks.picker.undo() end)
vim.keymap.set("n", "<leader>gl", function() Snacks.picker.git_log() end)
vim.keymap.set("n", "<leader>gs", function() Snacks.picker.git_status() end)
vim.keymap.set("n", "grd", function() Snacks.picker.lsp_definitions() end)
vim.keymap.set("n", "grr", function() Snacks.picker.lsp_references() end)
-- stylua: ignore end

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
