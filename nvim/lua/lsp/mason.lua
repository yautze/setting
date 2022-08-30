local mason_ok, mason = pcall(require, "mason")
if not mason_ok then
    vim.notify("mason not ready")
	return
end

local mason_lspconfig_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_ok then
    vim.notify("mason_lspconfig not ready")
	return
end

local ok, lspconfig = pcall(require, "lspconfig")
if not ok then
  vim.notify("lspconfig not ready")
  return
end

mason.setup()
mason_lspconfig.setup()

mason_lspconfig.setup_handlers {
	function (server_name)
		local opts = {
			on_attach = require("lsp.handlers").on_attach,
			capabilities = require("lsp.handlers").capabilities,
		}

		if server_name == "jsonls" then
			local jsonls_opts = require("lsp.settings.jsonls")
			opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
		end

		if server_name == "gopls" then
			local gopls_opts = require("lsp.settings.gopls")
			opts = vim.tbl_deep_extend("force", gopls_opts, opts)
		end

		if server_name == "solargraph" then
			local solargraph_opts = require("lsp.settings.solargraph")
			opts = vim.tbl_deep_extend("force", solargraph_opts, opts)
		end

		lspconfig.solargraph.setup{}
		lspconfig[server_name].setup(opts)
	end,
}
