local ok, configs = pcall(require, "nvim-treesitter.configs")
if not ok then
	return
end

configs.setup({
  ensure_installed = "all",
  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,
  -- Automatically install missing parsers when entering buffer
  auto_install = true,
  highlight = {
		enable = true, -- false will disable the whole extension
		disable = { "ruby" }, -- list of language that will be disabled
		additional_vim_regex_highlighting = true,
	},
  ainbow = {
    enable = true,
		extended_mod = false,
		max_file_lines = 300,
	},
	autopairs = {
		enable = true,
	},
	context_commentstring = {
		enable = true,
		enable_autocmd = false,
	},
  indent = { enable = true, disable = { "yaml" } },
})