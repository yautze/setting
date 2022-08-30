-- # nvim-tree

--[[
  config setting ref: https://github.com/kyazdani42/nvim-tree.lua/blob/master/doc/nvim-tree-lua.txt
]]--


-- init nvim_tree
local ok, nvim_tree = pcall(require, "nvim-tree")
if not ok then
	vim.notify("nvim-tree not ready")
	return
end

-- init nvim_tree_config
local config_ok, nvim_tree_config = pcall(require, "nvim-tree.config")
if not config_ok then
	vim.notify("nvim-tree.config not ready")
	return
end

local tree_cb = nvim_tree_config.nvim_tree_callback

nvim_tree.setup({
	auto_reload_on_write = true,
	disable_netrw = true,
	hijack_netrw = true,
	hijack_cursor = false,
	hijack_unnamed_buffer_when_opening = false,
	ignore_ft_on_setup = {
			"startify",
			"dashboard",
			"alpha",
	},
	open_on_tab = false,
	update_cwd = true,
	diagnostics = {
			enable = true,
			show_on_dirs = true,
			icons = {
					hint = "",
					info = "",
					warning = "",
					error = "",
			},
	},
	update_focused_file = {
			enable = true,
			update_cwd = true,
			ignore_list = {},
	},
	git = {
			enable = true,
			ignore = true,
			timeout = 500,
	},
	view = {
			width = 30,
			height = 30,
			hide_root_folder = false,
			side = "left",
			mappings = {
					custom_only = false,
					list = {
							{ key = { "l", "<CR>", "o" }, cb = tree_cb("edit") },
							{ key = "h", cb = tree_cb("close_node") },
							{ key = "v", cb = tree_cb("vsplit") },
					},
			},
			number = false,
			relativenumber = false,
	},
	renderer = {
			indent_markers = {
					enable = false,
					icons = {
							corner = "└ ",
							edge = "│ ",
							none = "  ",
					},
			},
			icons = {
					webdev_colors = true,
					git_placement = "before",
					padding = " ",
					symlink_arrow = " ➛ ",
					show = {
							file = true,
							folder = true,
							folder_arrow = true,
							git = true,
					},
					glyphs = {
							default = "",
							symlink = "",
							folder = {
									arrow_closed = "",
									arrow_open = "",
									default = "",
									open = "",
									empty = "",
									empty_open = "",
									symlink = "",
									symlink_open = "",
							},
							git = {
									unstaged = "✗",
									staged = "✓",
									unmerged = "",
									renamed = "➜",
									untracked = "★",
									deleted = "",
									ignored = "◌",
							},
					},
			},
	},
	filters = {
			dotfiles = false,
	},
	hijack_directories = {
			enable = true,
			auto_open = true,
	},
	actions = {
			use_system_clipboard = true,
			change_dir = {
					enable = true,
					global = false,
					restrict_above_cwd = false,
			},
			open_file = {
					quit_on_open = true,
					resize_window = false,
					window_picker = {
							enable = true,
							chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
							exclude = {
									filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
									buftype = { "nofile", "terminal", "help" },
							},
					},
			},
	},
})

vim.keymap.set("n", "<leader>ef", nvim_tree.toggle)