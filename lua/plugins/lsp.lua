require("mason").setup()
require("mason-lspconfig").setup({
        ensure_installed = {
            "asm_lsp",
            "clangd",
            "jdtls",
            "tsserver",
            "tailwindcss",
            "lua_ls",
            "svelte",
            "cssls",
            "somesass_ls",
            "dockerls",
            "docker_compose_language_service",
            "eslint",
            "graphql",
            "html",
            "jsonls",
            "prismals",
            "vuels",
            "rust_analyzer",
            "markdown_oxide"
        }
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

require("lspconfig").jdtls.setup {
    root_dir = require("lspconfig").util.root_pattern('.git', 'mvnw', 'gradlew', 'pom.xml', 'build.gradle'),
    settings = {
        java = {
            signatureHelp = { enabled = true },
            contentProvider = { preferred = 'fernflower' },
            -- Specify any other settings here
        }
    },
    on_attach = function(client, bufnr)
        local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
        local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

        -- Mappings.
        local opts = { noremap=true, silent=true }

        buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
        buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
        buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
        buf_set_keymap('n', 'gi', '<Cmd>lua vim.lsp.buf.implementation()<CR>', opts)
        buf_set_keymap('n', '<C-k>', '<Cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
        buf_set_keymap('n', '<space>wa', '<Cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
        buf_set_keymap('n', '<space>wr', '<Cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
        buf_set_keymap('n', '<space>wl', '<Cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
        buf_set_keymap('n', '<space>D', '<Cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
        buf_set_keymap('n', '<space>rn', '<Cmd>lua vim.lsp.buf.rename()<CR>', opts)
        buf_set_keymap('n', 'gr', '<Cmd>lua vim.lsp.buf.references()<CR>', opts)
        buf_set_keymap('n', '<space>ca', '<Cmd>lua vim.lsp.buf.code_action()<CR>', opts)
        buf_set_keymap('n', '<space>e', '<Cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
        buf_set_keymap('n', '[d', '<Cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
        buf_set_keymap('n', ']d', '<Cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
        buf_set_keymap('n', '<space>q', '<Cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
        buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
    end,
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
