local status_ok, wk = pcall(require, "which-key")
if not status_ok then
	return
end

local setup = {
	plugins = {
		marks = true,
		spelling = {
			enabled = true,
			suggestions = 20,
		},
		presets = {
			operators = false,
			motions = true,
			text_objects = true,
			windows = true,
			nav = true,
			z = true,
			g = true,
		},
	},
	icons = {
		breadcrumb = "»",
		separator = "➜",
		group = "+",
	},
	popup_mappings = {
		scroll_down = "<c-d>",
		scroll_up = "<c-u>",
	},
	window = {
		border = "rounded",
		position = "bottom",
		margin = { 1, 0, 1, 0 },
		padding = { 2, 2, 2, 2 },
		winblend = 0,
	},
	layout = {
		height = { min = 4, max = 25 },
		width = { min = 20, max = 50 },
		spacing = 3,
		align = "left",
	},
	ignore_missing = true,
	hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " },
	show_help = true,
	triggers = "auto",
	triggers_blacklist = {
		i = { "j", "k" },
		v = { "j", "k" },
	},
}

local opts = {
	mode = "n",
	prefix = "<leader>",
	buffer = nil,
	silent = true,
	noremap = true,
	nowait = true,
}

local mappings = {
	[";"] = { "<cmd>Alpha<CR>", "Dashboard" },
	["w"] = { "<cmd>w!<CR>", "Save" },
	["/"] = { "<Plug>(comment_toggle_linewise_current)", "Comment Line" },
	["h"] = { "<cmd>nohlsearch<CR>", "No Highlight" },
	["q"] = { "<cmd>q<CR>", "Quit" },
	["e"] = { "<cmd>NvimTreeToggle<CR>", "Explorer" },
	f = {
		name = "Files",
		f = { "<cmd>Telescope find_files<CR>", "Files" },
		t = { "<cmd>Telescope live_grep<CR>", "Search in files" },
		p = { "<cmd>Telescope projects<CR>", "Projects" },
		b = { "<cmd>Telescope buffers<CR>", "Buffers" },
	},
	d = {
		name = "Debugger",
		b = { "<cmd>lua require'dap'.toggle_breakpoint()<cr>", "Breakpoint" },
		c = { "<cmd>lua require'dap'.continue()<cr>", "Continue/Start" },
		i = { "<cmd>lua require'dap'.step_into()<cr>", "Step Into" },
		o = { "<cmd>lua require'dap'.step_over()<cr>", "Step Over" },
		O = { "<cmd>lua require'dap'.step_out()<cr>", "Step Out" },
		r = { "<cmd>lua require'dap'.repl.toggle()<cr>", "Repl" },
		l = { "<cmd>lua require'dap'.run_last()<cr>", "Run Last" },
		u = { "<cmd>lua require'dapui'.toggle()<cr>", "UI" },
	},
	p = {
		name = "Packer",
		c = { "<cmd>PackerCompile<cr>", "Compile" },
		i = { "<cmd>PackerInstall<cr>", "Install" },
		r = { "<cmd>lua require('lvim.plugin-loader').recompile()<cr>", "Re-compile" },
		s = { "<cmd>PackerSync<cr>", "Sync" },
		S = { "<cmd>PackerStatus<cr>", "Status" },
		u = { "<cmd>PackerUpdate<cr>", "Update" },
	},
	b = {
		name = "Buffer",
		j = { "<cmd>BufferLinePick<cr>", "Jump" },
		f = { "<cmd>Telescope buffers<cr>", "Find" },
		h = { "<cmd>BufferLineCloseLeft<cr>", "Close all to the left" },
		l = { "<cmd>BufferLineCloseRight<cr>", "Close all to the right" },
		q = { "<cmd>BufferLinePickClose<cr>", "Pick buffer to close" },
		D = { "<cmd>BufferLineSortByDirectory<cr>", "Sort by directory" },
		L = { "<cmd>BufferLineSortByExtension<cr>", "Sort by language" },
	},
	g = {
		name = "Git",
		g = { "<cmd>lua _LAZYGIT_TOGGLE()<CR>", "LazyGit" },
		j = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk" },
		k = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk" },
		l = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
		p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
		r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
		R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
		s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
		u = {
			"<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
			"Undo Stage Hunk",
		},
		o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
		b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
		c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
		C = {
			"<cmd>Telescope git_bcommits<cr>",
			"Checkout commit(for current file)",
		},
		d = {
			"<cmd>Gitsigns diffthis HEAD<cr>",
			"Git Diff",
		},
	},
	s = {
		name = "Search",
		b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
		c = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
		f = { "<cmd>Telescope find_files<cr>", "Find File" },
		h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
		H = { "<cmd>Telescope highlights<cr>", "Find highlight groups" },
		M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
		r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
		R = { "<cmd>Telescope registers<cr>", "Registers" },
		t = { "<cmd>Telescope live_grep<cr>", "Text" },
		k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
		C = { "<cmd>Telescope commands<cr>", "Commands" },
		p = {
			"<cmd>lua require('telescope.builtin').colorscheme({enable_preview = true})<cr>",
			"Colorscheme with Preview",
		},
	},
	t = {
		name = "Terminals",
		p = { "<cmd>lua _PRY_TOGGLE()<cr>", "Pry" },
		j = { "<cmd>lua _NODE_TOGGLE()<cr>", "Node" },
		n = { "<cmd>lua _NU_TOGGLE()<cr>", "NuShell" },
	},
}

wk.setup(setup)
wk.register(mappings, opts)
