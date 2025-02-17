
-- Require lsp-zero for managing Language Server Protocol servers
local lsp = require("lsp-zero")

-- Use the recommended preset configuration for lsp-zero
lsp.preset("recommended")

-- Ensure the specified LSP servers are installed
lsp.ensure_installed({
  'tsserver',     -- TypeScript server
  'eslint',       -- ESLint for JavaScript/TypeScript linting
  'sumneko_lua',  -- Lua language server
  'rust_analyzer', -- Rust language server
  'svelte',        -- Svelte language server
  'gopls'         -- Go language server

})

-- Configure the Lua language server to recognize 'vim' as a global variable
lsp.configure('sumneko_lua', {
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        }
    }
})

-- Require cmp for completion management
local cmp = require('cmp')

-- Define key mappings for completion using cmp
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
  ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
  ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
  ['<C-y>'] = cmp.mapping.confirm({ select = true }),
  ["<C-Space>"] = cmp.mapping.complete(),
})

-- Disable completion with tab for Copilot compatibility
cmp_mappings['<Tab>'] = nil
cmp_mappings['<S-Tab>'] = nil

-- Set up completion using cmp
lsp.setup_nvim_cmp({
  mapping = cmp_mappings
})

-- Set preferences for lsp-zero
lsp.set_preferences({
    suggest_lsp_servers = false,  -- Disable automatic suggestion of additional LSP servers
    sign_icons = {
        error = 'E',
        warn = 'W',
        hint = 'H',
        info = 'I'
    }
})

-- Define key mappings and actions to be executed when attaching to an LSP server
lsp.on_attach(function(client, bufnr)
  local opts = { buffer = bufnr, remap = false }

  if client.name == "eslint" then
      -- Disable eslint client as it may conflict with other linters/formatters
      vim.cmd.LspStop('eslint')
      return
  end

  -- Set up common LSP key mappings
  --vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
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
