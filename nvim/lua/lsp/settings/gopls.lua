return {
    -- cmd = { "gopls" , "serve"},
    cmd = { "gopls", "-remote=auto" },
    filetype = { "go", "gomod", "gohtmltmpl", "gotexttmpl"},
    root_dir = require("lspconfig").util.root_pattern("go.mod", ".git"),
    -- on_attach = function(client)  -- on_attach for gopls
    --     -- your special on attach here
    --     -- e.g. disable gopls format because a known issue https://github.com/golang/go/issues/45732
    --     -- print("i am a hook, I will disable document format")
    --     client.resolved_capabilities.document_formatting = false
    -- end,
    setting = {
      gopls = {
        -- more settings: https://github.com/golang/tools/blob/master/gopls/doc/settings.md
        analyses = {
          unusedparams = true, 
          unreachable = false
        },
        codelenses = {
          generate = true, -- show the `go generate` lens.
          gc_details = true, --  Show a code lens toggling the display of gc's choices.
          test = true,
          tidy = true
        },
        usePlaceholders = true,
        completeUnimported = true,
        staticcheck = true,
        matcher = 'fuzzy',
        diagnosticsDelay = '25ms',
        experimentalWatchedFileDelay = '100ms',
        symbolMatcher = 'fuzzy',
        gofumpt = true, -- true, -- turn on for new repos, gofmpt is good but also create code turmoils
        buildFlags = {"-tags", "integration"}
        -- buildFlags = {"-tags", "functional"}
      }
    },
}
