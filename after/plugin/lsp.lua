-- Require lsp-zero for managing Language Server Protocol servers
local lsp = require("lsp-zero")

-- Use the recommended preset configuration for lsp-zero
lsp.extend_lspconfig()

-- Install and configure mason for LSP management
-- Mason setup
require('mason').setup({})

-- Mason LSP Config setup
require("mason-lspconfig").setup {
    ensure_installed = { "lua_ls", "rust_analyzer", "bashls", "tailwindcss", "cssls", "docker_compose_language_service", "dockerls", "gopls", "graphql", "html", "eslint",
        "marksman", "pylyzer", "sqls", "ts_ls"
    },
}


-- Setup individual LSP servers
local lspconfig = require('lspconfig')

lspconfig.typescript_language_server.setup({})
lspconfig.eslint.setup({})
lspconfig.lua_ls.setup({
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        }
    }
})
require'lspconfig'.gopls.setup{}
-- Require cmp for completion management
local cmp = require('cmp')

-- Define key mappings for completion using cmp
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = cmp_mappings or {
    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
    ["<C-Space>"] = cmp.mapping.complete(),
}


-- Disable completion with tab for Copilot compatibility
cmp_mappings['<Tab>'] = nil
cmp_mappings['<S-Tab>'] = nil


cmp.setup({
    mapping = cmp_mappings,    -- Keep your previous mappings
    sources = {
        { name = 'nvim_lsp' }, -- LSP completions
        { name = 'buffer' },   -- Buffer completions
        { name = 'path' },     -- Path completions
        -- Add more sources as needed
    },
}) -- Set preferences for lsp-zero
-- Manually set diagnostic symbols
vim.diagnostic.config({
    virtual_text = true,
    signs = true,
    update_in_insert = false,
    severity_sort = true,
})

-- Set up diagnostic signs
local signs = { Error = "E", Warn = "W", Hint = "H", Info = "I" }
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, numhl = hl })
end


-- Define key mappings and actions to be executed when attaching to an LSP server
lsp.on_attach(function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }

    if client.name == "eslint" then
        -- Disable eslint client as it may conflict with other linters/formatters
        vim.cmd.LspStop('eslint')
        return
    end

    -- Set up common LSP key mappings
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
    vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)
    vim.keymap.set("n", "[d", vim.diagnostic.goto_next, opts)
    vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, opts)
    vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action, opts)
    vim.keymap.set("n", "<leader>vrr", vim.lsp.buf.references, opts)
    vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename, opts)
    vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
end)

-- Set up the overall configuration for lsp-zero
lsp.setup()

-- Configure virtual text for diagnostics
vim.diagnostic.config({
    virtual_text = true,
})
