local fn = vim.fn

-- 自動安裝 packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})

	print("Installing packer close and reopen nvim")
	vim.cmd([[packadd packer.nvim]])
end

-- 設定檔確認是否存在
local status_ok, packer = pcall(require, "packer") if not status_ok then
	return
end

-- 自動重讀配置檔案當你儲存 plugins.lua 時
vim.cmd([[
	augroup packer_user_config
		autocmd!
		autocmd BufWritePost plugins.lua source <afile> | PackerSync
	augroup END
]])

-- 彈出漂浮視窗
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- 安裝插件
return packer.startup(function(use)
  -- core
  use("wbthomason/packer.nvim") -- 安裝插件管理工具
	use("nvim-lua/plenary.nvim")  -- 大量Lua方法覆用工具
	use("lewis6991/impatient.nvim") -- 加速導入lua 模組工具
	use("nvim-lua/popup.nvim") -- 控管懸浮視窗的插件
	use("antoinemadec/FixCursorHold.nvim") -- This is needed to fix lsp doc highlight

	-- 歡迎頁面
	use("goolord/alpha-nvim") 

	-- theme
	use("EdenEast/nightfox.nvim")

	-- notify
	use("rcarriga/nvim-notify")

	-- quick comment
	use("numToStr/Comment.nvim")
	use("JoosepAlviste/nvim-ts-context-commentstring")

  -- nvim-tree
	use("kyazdani42/nvim-web-devicons") -- nvim-tree icons
	use("kyazdani42/nvim-tree.lua")

	-- treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})
	use("nvim-treesitter/nvim-treesitter-textobjects")
	use("nvim-treesitter/nvim-treesitter-refactor")

	-- git
	use({
		"lewis6991/gitsigns.nvim",
		requires = {
			"nvim-lua/plenary.nvim",
		},
	})

	-- 檔案搜尋
	use({
		"nvim-telescope/telescope.nvim",
		requires = {
			"nvim-lua/plenary.nvim", -- 大量Lua方法覆用工具
			"nvim-telescope/telescope-project.nvim", -- Manage projects with telescope
			"nvim-telescope/telescope-frecency.nvim", -- Frequent and recent file cache
			"nvim-telescope/telescope-media-files.nvim", -- Media file
			{ "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
			"ahmedkhalf/project.nvim", -- 專案管理工具
		},
	})

	-- Buffer
	use("akinsho/bufferline.nvim") -- buffer 視窗插件
	use("moll/vim-bbye") -- buffer 關閉當下插件

	-- LSP
	use("neovim/nvim-lspconfig")
	use("williamboman/mason.nvim") -- lsp installer
	use("williamboman/mason-lspconfig.nvim")

	-- CMP for auto complete
	use({
		"hrsh7th/nvim-cmp",
		requires = {
			"hrsh7th/cmp-buffer", -- buffer completions
			"hrsh7th/cmp-nvim-lsp", -- LSP completions
			"hrsh7th/cmp-path", -- path completions
			"hrsh7th/cmp-cmdline", -- cmdline completions
			"hrsh7th/cmp-nvim-lua", -- cmp-nvim-lua
			"hrsh7th/cmp-emoji",
			"saadparwaiz1/cmp_luasnip", -- snippet completions
			"hrsh7th/cmp-nvim-lsp-signature-help",
		},
	}) 

	-- snippets
	use("L3MON4D3/LuaSnip") -- snippet engine
	use("rafamadriz/friendly-snippets") -- a bunch of snippets to use

	-- language tools
	-- Golang
	use({
		"ray-x/go.nvim",
		run = ":GoInstallBinaries",
		requires = {
			{ "ray-x/guihua.lua", run = "cd lua/fzy && make" },
		},
	})

	-- 錯誤提示
	use({
		"folke/trouble.nvim",
		requires = "kyazdani42/nvim-web-devicons",
	})

	-- 狀態列
	use({
		'nvim-lualine/lualine.nvim',
		requires = { 'kyazdani42/nvim-web-devicons', opt = true }
	})

	-- 對齊線
	use("lukas-reineke/indent-blankline.nvim")

	-- 滑鼠在的那一行高亮顯示
	use("folke/twilight.nvim")

	-- 括弧彩色對應
	use("p00f/nvim-ts-rainbow")

	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
