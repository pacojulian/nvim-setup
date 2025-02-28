-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- empty setup using defaults
require("nvim-tree").setup()

-- OR setup with some options
require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    adaptive_size = true,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
  -- Use the new on_attach function to define key mappings
  on_attach = function(bufnr)
    local api = require('nvim-tree.api')

    -- Define your key mappings here
    local opts = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set('n', 'u', api.tree.change_root_to_parent, opts) -- This replaces "dir_up"
  end,
})

