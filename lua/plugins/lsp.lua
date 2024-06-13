require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = { "clangd", "tsserver", "tailwindcss", "lua_ls", "svelte", "cssls", "somesass_ls", "dockerls", "docker_compose_language_service", "eslint", "graphql", "html", "jsonls", "prismals", "vuels", "rust_analyzer", "markdown_oxide" }
})

local capabilities = require("cmp_nvim_lsp").default_capabilities()

require("lsp-zero").on_attach(function(_, bufnr)
    local opts = {buffer = bufnr, remap = false}

    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
    vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)

require("lspconfig").clangd.setup {
    capabilities = capabilities
}

require("lspconfig").lua_ls.setup {
    capabilities = capabilities,
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim" }
            }
        }
    }
}
require("lspconfig").tsserver.setup {
    capabilities = capabilities
}
require("lspconfig").tailwindcss.setup {
    capabilities = capabilities
}
require("lspconfig").svelte.setup {
    capabilities = capabilities
}
require("lspconfig").cssls.setup {
    capabilities = capabilities,
    settings = {
        css = {
            lint = {
                unknownAtRules = "ignore"
            }
        },
        scss = {
            lint = {
                unknownAtRules = "ignore"
            }
        }
    }
}
require("lspconfig").somesass_ls.setup {
    capabilities = capabilities
}
require("lspconfig").dockerls.setup {
    capabilities = capabilities
}
require("lspconfig").docker_compose_language_service.setup {
    capabilities = capabilities
}
require("lspconfig").eslint.setup {
    capabilities = capabilities
}
require("lspconfig").graphql.setup {
    capabilities = capabilities
}
require("lspconfig").html.setup {
    capabilities = capabilities
}
require("lspconfig").jsonls.setup {
    capabilities = capabilities
}
require("lspconfig").prismals.setup {
    capabilities = capabilities
}
require("lspconfig").vuels.setup {
    capabilities = capabilities
}
require("lspconfig").rust_analyzer.setup {
    capabilities = capabilities
}
require("lspconfig").markdown_oxide.setup {
    capabilities = capabilities
}
