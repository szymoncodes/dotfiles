local vim = vim
-- Cursor
vim.opt.guicursor = "n-v-i-c:block-Cursor"

-- Text
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.smartindent = true
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
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
	{ src = "https://github.com/everviolet/nvim" },
	{ src = "https://github.com/AlexvZyl/nordic.nvim" },
	{ src = "https://github.com/catppuccin/nvim",                 name = "catppuccin" },
	{ src = "https://github.com/rose-pine/neovim" },
	{ src = "https://github.com/mason-org/mason.nvim" },
	{ src = "https://github.com/stevearc/oil.nvim" },
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/mbbill/undotree" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "master" },
	{ src = "https://github.com/folke/snacks.nvim" },
	{ src = "https://github.com/nvim-mini/mini.nvim" },
	{ src = "https://github.com/supermaven-inc/supermaven-nvim" },
	{ src = "https://github.com/benomahony/uv.nvim" },
	{ src = "https://github.com/Myriad-Dreamin/tinymist" },
	{ src = "https://github.com/chomosuke/typst-preview.nvim" }
})

-- Setting the colorscheme
require("evergarden").setup({
	theme = { variant = "spring" },
	editor = { transparent_background = true },
})

require("nordic").setup({
	transparent = { bg = true },
})

require("catppuccin").setup({
	flavour = "mocha",
	transparent_background = true,
})

require("rose-pine").setup({
	variant = "moon",
	styles = {
		transparency = true,
	},
})

vim.cmd("colorscheme rose-pine")
vim.cmd(":hi statusline guibg=NONE")
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none" })
vim.api.nvim_set_hl(0, "Search", { bg = "none", fg = "#88c0d0" })

-- Setting up the LSP
require("mason").setup()
require("nvim-treesitter.configs").setup({ ensure_installed = { "lua", "python", "regex" }, auto_install = true })
vim.lsp.enable({ "lua_ls", "pyright", "tinymist" })
vim.lsp.config["tinymist"] = {
	settings = {
		formatterMode = "typstyle",
		formatterProseWrap = true,
		formatterPrintWidth = 80,
		formatterIndentSize = 2,
	}
}
vim.diagnostic.config({
	virtual_text = true,
	signs = true,
})
require("uv").setup()
require("supermaven-nvim").setup({})

-- Setting up other plugins
require("oil").setup({
	view_options = { show_hidden = true },
})
require("mini.surround").setup()
require("mini.pairs").setup()
require("mini.icons").setup()
require("mini.comment").setup()
require("snacks").setup({
	indent = { enabled = true },
	picker = { enabled = true },
	terminal = { enabled = true, win = { border = "rounded" } },
})
require("typst-preview").setup()

-- Keybinds
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>r", ":update<CR> :source<CR>")
vim.keymap.set("n", "<leader>-", ":Oil --float<CR>")

vim.keymap.set("n", "<leader>=", vim.lsp.buf.format)

vim.keymap.set("n", "<leader>ff", function() Snacks.picker.files({ hidden = true }) end)
vim.keymap.set("n", "<leader>fh", function() Snacks.picker.help() end)
vim.keymap.set("n", "<leader>fg", function() Snacks.picker.grep() end)
vim.keymap.set("n", "<leader>fr", function() Snacks.picker.recent() end)
vim.keymap.set("n", "<leader>t", function() Snacks.terminal.toggle(vim.o.shell) end)

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.cmd [[set completeopt+=menuone,noselect,popup]]
