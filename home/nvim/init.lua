-- ============================================================================
-- Neovim Configuration
-- Languages: Python (Astral: ruff, uv, ty), Rust, Terraform, Shell, Markdown
-- Additional: JSON, YAML, Lua
-- ============================================================================

-- Set leader key early
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- ============================================================================
-- Core Settings
-- ============================================================================

local opt = vim.opt

-- Line numbers
opt.number = true
opt.relativenumber = true

-- Tabs and indentation
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true
opt.breakindent = true

-- Line wrapping
opt.wrap = false
opt.linebreak = true

-- Search settings
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = false
opt.incsearch = true

-- Appearance
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"
opt.cursorline = true
opt.colorcolumn = "100"

-- Scrolling and whitespace
opt.scrolloff = 10
opt.list = true
opt.listchars = { tab = "»·", trail = "·", nbsp = "␣" }

-- Backspace
opt.backspace = "indent,eol,start"

-- Clipboard
opt.clipboard:append("unnamedplus")

-- Split windows
opt.splitright = true
opt.splitbelow = true

-- Performance
opt.updatetime = 250
opt.timeoutlen = 300
opt.swapfile = false
opt.backup = false
opt.undofile = true
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"

-- Mouse
opt.mouse = "a"

-- Cursor
opt.guicursor = "n-v-c-sm:hor20,i-ci-ve:ver25,r-cr-o:hor20"

-- Completion
opt.completeopt = "menu,menuone,noselect"

-- Folding (with treesitter)
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"
opt.foldenable = false

-- Conceal (disable for JSON/markdown to avoid weird characters)
opt.conceallevel = 0
opt.concealcursor = ""

-- ============================================================================
-- Bootstrap lazy.nvim (Plugin Manager)
-- ============================================================================

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- ============================================================================
-- Plugins
-- ============================================================================

require("lazy").setup({

	-- Treesitter - Syntax highlighting
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter.config").setup()

			-- Enable treesitter highlighting automatically
			vim.api.nvim_create_autocmd("FileType", {
				pattern = "*",
				callback = function()
					local buf = vim.api.nvim_get_current_buf()
					if not vim.b[buf].treesitter_enabled then
						pcall(vim.treesitter.start)
						vim.b[buf].treesitter_enabled = true
					end
				end,
			})

			-- Enable incremental selection
			vim.keymap.set("n", "<C-space>", function()
				if vim.treesitter.get_node() then
					vim.cmd("normal! v")
				end
			end, { desc = "Start treesitter selection" })
		end,
	},

	-- LSP Configuration
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			{ "antosha417/nvim-lsp-file-operations", config = true },
			{ "j-hui/fidget.nvim", opts = {} },
		},
		config = function()
			-- Setup LSP keybindings on attach
			vim.api.nvim_create_autocmd("LspAttach", {
				callback = function(args)
					local bufnr = args.buf
					local client = vim.lsp.get_client_by_id(args.data.client_id)

					local map = function(keys, func, desc)
						vim.keymap.set("n", keys, func, { buffer = bufnr, desc = "LSP: " .. desc, silent = true })
					end

					-- Navigation
					map("gd", vim.lsp.buf.definition, "Goto Definition")
					map("gD", vim.lsp.buf.declaration, "Goto Declaration")
					map("gi", vim.lsp.buf.implementation, "Goto Implementation")
					map("gr", vim.lsp.buf.references, "Goto References")

					-- Documentation
					map("K", vim.lsp.buf.hover, "Hover Documentation")

					-- Actions
					map("<leader>ca", vim.lsp.buf.code_action, "Code Action")
					map("<leader>rn", vim.lsp.buf.rename, "Rename")
					map("<leader>f", vim.lsp.buf.format, "Format")

					-- Diagnostics
					map("<leader>d", vim.diagnostic.open_float, "Show Diagnostic")
					map("[d", function()
						vim.diagnostic.jump({ count = -1 })
					end, "Previous Diagnostic")
					map("]d", function()
						vim.diagnostic.jump({ count = 1 })
					end, "Next Diagnostic")

					-- Disable hover for ruff in favor of ty
					if client and client.name == "ruff" then
						client.server_capabilities.hoverProvider = false
					end
				end,
			})

			-- Python: ruff LSP for linting/formatting
			vim.lsp.config("ruff", {
				cmd = { "ruff", "server" },
				filetypes = { "python" },
				root_markers = { "pyproject.toml", "setup.py", "setup.cfg", "requirements.txt", ".git" },
				settings = {
					lint = { enable = true },
					format = { enable = true },
				},
			})
			vim.lsp.enable("ruff")

			-- Python: ty for type checking
			vim.lsp.config("ty", {
				cmd = { "ty", "server" },
				filetypes = { "python" },
				root_markers = { "pyproject.toml", "setup.py", "setup.cfg", "requirements.txt", ".git" },
				settings = {
					ty = {},
				},
			})
			vim.lsp.enable("ty")

			-- Terraform
			vim.lsp.config("terraformls", {
				cmd = { "terraform-ls", "serve" },
				filetypes = { "terraform", "tf", "hcl" },
				root_markers = { ".terraform", ".git" },
			})
			vim.lsp.enable("terraformls")

			-- Bash/Shell
			vim.lsp.config("bashls", {
				cmd = { "bash-language-server", "start" },
				filetypes = { "sh", "bash" },
				root_markers = { ".git" },
			})
			vim.lsp.enable("bashls")

			-- Markdown
			vim.lsp.config("marksman", {
				cmd = { "marksman", "server" },
				filetypes = { "markdown", "markdown.mdx" },
				root_markers = { ".marksman.toml", ".git" },
			})
			vim.lsp.enable("marksman")

			-- JSON
			vim.lsp.config("jsonls", {
				cmd = { "vscode-json-language-server", "--stdio" },
				filetypes = { "json", "jsonc" },
				root_markers = { ".git" },
			})
			vim.lsp.enable("jsonls")

			-- Disable concealment for JSON files (fixes weird ^B characters)
			vim.api.nvim_create_autocmd("FileType", {
				pattern = { "json", "jsonc", "markdown" },
				callback = function()
					vim.opt_local.conceallevel = 0
					vim.opt_local.concealcursor = ""
				end,
			})

			-- YAML
			vim.lsp.config("yamlls", {
				cmd = { "yaml-language-server", "--stdio" },
				filetypes = { "yaml", "yaml.docker-compose" },
				root_markers = { ".git" },
			})
			vim.lsp.enable("yamlls")

			-- Lua
			vim.lsp.config("lua_ls", {
				cmd = { "lua-language-server" },
				filetypes = { "lua" },
				root_markers = {
					".luarc.json",
					".luarc.jsonc",
					".luacheckrc",
					".stylua.toml",
					"stylua.toml",
					"selene.toml",
					"selene.yml",
					".git",
				},
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" },
						},
						workspace = {
							library = vim.api.nvim_get_runtime_file("", true),
							checkThirdParty = false,
						},
						telemetry = { enable = false },
					},
				},
			})
			vim.lsp.enable("lua_ls")
		end,
	},

	-- Autocompletion
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-nvim-lsp",
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
			"rafamadriz/friendly-snippets",
		},
		config = function()
			local cmp = require("cmp")
			local luasnip = require("luasnip")

			require("luasnip.loaders.from_vscode").lazy_load()

			cmp.setup({
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end,
				},
				mapping = cmp.mapping.preset.insert({
					["<C-n>"] = cmp.mapping.select_next_item(),
					["<C-p>"] = cmp.mapping.select_prev_item(),
					["<C-d>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.abort(),
					["<CR>"] = cmp.mapping.confirm({ select = true }),
					["<Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_next_item()
						elseif luasnip.expand_or_jumpable() then
							luasnip.expand_or_jump()
						else
							fallback()
						end
					end, { "i", "s" }),
					["<S-Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_prev_item()
						elseif luasnip.jumpable(-1) then
							luasnip.jump(-1)
						else
							fallback()
						end
					end, { "i", "s" }),
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
					{ name = "buffer" },
					{ name = "path" },
				}),
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
			})
		end,
	},

	-- Formatting
	{
		"stevearc/conform.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			local conform = require("conform")

			conform.setup({
				formatters_by_ft = {
					python = { "ruff_format", "ruff_organize_imports" },
					rust = { "rustfmt" },
					terraform = { "tofu_fmt" },
					sh = { "shfmt" },
					bash = { "shfmt" },
					markdown = { "prettier" },
					json = { "jq" },
					yaml = { "prettier" },
					lua = { "stylua" },
				},
				format_after_save = {
					timeout_ms = 1000,
					lsp_fallback = true,
				},
				formatters = {
					tofu_fmt = {
						command = "tofu",
						args = { "fmt", "-" },
						stdin = true,
					},
					ruff_format = {
						command = "ruff",
						args = { "format", "--stdin-filename", "$FILENAME", "-" },
						stdin = true,
					},
					ruff_organize_imports = {
						command = "ruff",
						args = { "check", "--select", "I", "--fix", "--stdin-filename", "$FILENAME", "-" },
						stdin = true,
					},
				},
			})
		end,
	},

	-- Linting
	{
		"mfussenegger/nvim-lint",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			local lint = require("lint")

			lint.linters_by_ft = {
				python = { "ruff" },
				terraform = { "tflint" },
				sh = { "shellcheck" },
				bash = { "shellcheck" },
				markdown = { "markdownlint" },
				json = { "jsonlint" },
				yaml = { "yamllint" },
			}

			local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
			vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
				group = lint_augroup,
				callback = function()
					lint.try_lint()
				end,
			})
		end,
	},

	-- File explorer
	{
		"nvim-tree/nvim-tree.lua",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("nvim-tree").setup({
				view = {
					width = 35,
				},
				renderer = {
					group_empty = true,
				},
				filters = {
					dotfiles = false,
				},
			})

			vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { desc = "Toggle file explorer", silent = true })
		end,
	},

	-- Fuzzy finder
	{
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		},
		config = function()
			local telescope = require("telescope")
			local actions = require("telescope.actions")

			telescope.setup({
				defaults = {
					mappings = {
						i = {
							["<C-k>"] = actions.move_selection_previous,
							["<C-j>"] = actions.move_selection_next,
							["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
						},
					},
				},
			})

			telescope.load_extension("fzf")

			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
			vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live grep" })
			vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find buffers" })
			vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Help tags" })
			vim.keymap.set("n", "<leader>fr", builtin.oldfiles, { desc = "Recent files" })
		end,
	},

	-- Git integration
	{
		"lewis6991/gitsigns.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("gitsigns").setup({
				signs = {
					add = { text = "+" },
					change = { text = "~" },
					delete = { text = "_" },
					topdelete = { text = ">" },
					changedelete = { text = "~" },
				},
			})

			vim.keymap.set("n", "<leader>gb", ":Gitsigns blame_line<CR>", { desc = "Git blame" })
			vim.keymap.set("n", "<leader>gp", ":Gitsigns preview_hunk<CR>", { desc = "Preview hunk" })
			vim.keymap.set("n", "<leader>gr", ":Gitsigns reset_hunk<CR>", { desc = "Reset hunk" })
		end,
	},

	{
		"tpope/vim-fugitive",
		cmd = { "Git", "G" },
	},

	-- Status line
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("lualine").setup({
				options = {
					theme = "auto",
					component_separators = "|",
					section_separators = "",
				},
			})
		end,
	},

	-- Buffer line
	{
		"akinsho/bufferline.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		version = "*",
		config = function()
			require("bufferline").setup({
				options = {
					mode = "buffers",
					offsets = {
						{
							filetype = "NvimTree",
							text = "File Explorer",
							highlight = "Directory",
							separator = true,
						},
					},
				},
			})

			vim.keymap.set("n", "<Tab>", ":BufferLineCycleNext<CR>", { desc = "Next buffer", silent = true })
			vim.keymap.set("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", { desc = "Previous buffer", silent = true })
		end,
	},

	-- Auto pairs
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
	},

	-- Comment
	{
		"numToStr/Comment.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = true,
	},

	-- Indent guides
	{
		"lukas-reineke/indent-blankline.nvim",
		event = { "BufReadPre", "BufNewFile" },
		main = "ibl",
		opts = {
			indent = { char = "│" },
			scope = { enabled = false },
		},
	},

	-- Which-key (shows keybindings)
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
		end,
		opts = {},
	},

	-- Rust-specific tools
	{
		"mrcjkb/rustaceanvim",
		version = "^5",
		lazy = false,
	},

	-- Markdown preview
	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		ft = { "markdown" },
		build = function()
			vim.fn["mkdp#util#install"]()
		end,
		config = function()
			vim.keymap.set("n", "<leader>mp", ":MarkdownPreview<CR>", { desc = "Markdown preview" })
		end,
	},

	-- Python virtual environment selector (works with uv)
	{
		"linux-cultist/venv-selector.nvim",
		dependencies = { "neovim/nvim-lspconfig", "nvim-telescope/telescope.nvim" },
		ft = "python",
		config = function()
			require("venv-selector").setup({
				name = { "venv", ".venv", "env", ".env" },
				auto_refresh = true,
			})
			vim.keymap.set("n", "<leader>vs", ":VenvSelect<CR>", { desc = "Select Python venv" })
		end,
	},
}, {
	rocks = {
		enabled = false,
	},
})

-- Apply colorscheme
vim.cmd.colorscheme("synthwave")

-- ============================================================================
-- Additional Keymaps
-- ============================================================================

local keymap = vim.keymap

-- General
keymap.set("n", "<leader>w", ":w<CR>", { desc = "Save file" })
keymap.set("n", "<leader>q", ":q<CR>", { desc = "Quit" })
keymap.set("n", "<leader>x", ":x<CR>", { desc = "Save and quit" })
keymap.set("n", "<Esc>", ":nohlsearch<CR>", { desc = "Clear search highlights" })

-- Window management
keymap.set("n", "<leader>sv", ":vsplit<CR>", { desc = "Split vertically" })
keymap.set("n", "<leader>sh", ":split<CR>", { desc = "Split horizontally" })
keymap.set("n", "<leader>sx", ":close<CR>", { desc = "Close split" })

-- Window navigation
keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left split" })
keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to below split" })
keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to above split" })
keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right split" })

-- Resize windows
keymap.set("n", "<C-Up>", ":resize +2<CR>")
keymap.set("n", "<C-Down>", ":resize -2<CR>")
keymap.set("n", "<C-Left>", ":vertical resize -2<CR>")
keymap.set("n", "<C-Right>", ":vertical resize +2<CR>")

-- Buffer management
keymap.set("n", "<leader>bd", ":bd<CR>", { desc = "Delete buffer" })

-- Better indenting
keymap.set("v", "<", "<gv")
keymap.set("v", ">", ">gv")

-- Move lines
keymap.set("n", "<A-j>", ":m .+1<CR>==", { desc = "Move line down" })
keymap.set("n", "<A-k>", ":m .-2<CR>==", { desc = "Move line up" })
keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- Diagnostic list
keymap.set("n", "<leader>dl", vim.diagnostic.setloclist, { desc = "Diagnostic list" })

-- ============================================================================
-- Autocommands
-- ============================================================================

local autocmd = vim.api.nvim_create_autocmd

-- Highlight on yank
autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank({ timeout = 200 })
	end,
})

-- Autosave on focus lost, buffer leave, or leaving insert mode
autocmd({ "FocusLost", "BufLeave", "InsertLeave" }, {
	pattern = "*",
	callback = function()
		if vim.bo.modified and vim.fn.expand("%") ~= "" and not vim.bo.readonly then
			vim.cmd("silent! write")
		end
	end,
})

-- Remove trailing whitespace on save
autocmd("BufWritePre", {
	pattern = "*",
	command = [[%s/\s\+$//e]],
})

-- Terraform settings
autocmd("FileType", {
	pattern = { "terraform", "tf", "hcl" },
	callback = function()
		vim.opt_local.tabstop = 2
		vim.opt_local.shiftwidth = 2
	end,
})

-- Markdown settings
autocmd("FileType", {
	pattern = "markdown",
	callback = function()
		vim.opt_local.wrap = true
		vim.opt_local.spell = true
	end,
})

-- ============================================================================
-- Diagnostic Configuration
-- ============================================================================

vim.diagnostic.config({
	virtual_text = true,
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = " ",
			[vim.diagnostic.severity.WARN] = " ",
			[vim.diagnostic.severity.HINT] = " ",
			[vim.diagnostic.severity.INFO] = " ",
		},
	},
	update_in_insert = false,
	underline = true,
	severity_sort = true,
	float = {
		focusable = false,
		style = "minimal",
		border = "rounded",
		source = true,
		header = "",
		prefix = "",
	},
})

-- ============================================================================
-- Python Astral Stack Configuration
-- ============================================================================

-- Set environment variable to prefer uv for Python execution
vim.env.UV_PYTHON_PREFERENCE = "only-managed"

-- Add ruff check command
vim.api.nvim_create_user_command("RuffCheck", function()
	vim.cmd("!ruff check %")
end, { desc = "Run ruff check on current file" })

-- Add ruff fix command
vim.api.nvim_create_user_command("RuffFix", function()
	vim.cmd("!ruff check --fix %")
end, { desc = "Run ruff check --fix on current file" })

-- ============================================================================
-- Treesitter Parser Installation
-- ============================================================================

-- Install all required treesitter parsers
vim.api.nvim_create_user_command("TSInstallAll", function()
	local parsers = {
		"python",
		"rust",
		"bash",
		"markdown",
		"markdown_inline",
		"terraform",
		"hcl",
		"lua",
		"vim",
		"vimdoc",
		"query",
		"json",
		"yaml",
		"toml",
		"go",
		"javascript",
		"typescript",
		"html",
		"css",
		"dockerfile",
		"nix",
	}
	vim.cmd("TSInstall " .. table.concat(parsers, " "))
end, { desc = "Install all required treesitter parsers" })

-- All system dependencies are managed by Nix (home/editor.nix and home/dev.nix).
-- Run :TSInstallAll to install treesitter parsers (one-time setup).
