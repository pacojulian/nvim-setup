local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.git_files, {})
vim.keymap.set('n', '<leader>fbb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fs', function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>fl', builtin.lsp_document_symbols, {})
vim.keymap.set('n', '<leader>fm', builtin.lsp_workspace_symbols, {})

require('telescope').setup {
    defaults = {
        -- Use ripgrep for grep-based searches
        vimgrep_arguments = {
            'rg',
            '--color=never',
            '--no-heading',
            '--with-filename',
            '--line-number',
            '--column',
            '--smart-case',
            '--hidden',          -- Include hidden files
            '--iglob', '!.git/', -- Exclude .git
        },
        -- Use fd for find_files if available
        find_command = {
            'fd',
            '--type', 'f',
            '--hidden',
            '--exclude', '.git',
            '--exclude', 'node_modules',
        },
        layout_config = {
            preview_cutoff = 40,
            width = 0.75,
        },
        cache_picker = {
            num_pickers = 10,
        },
        file_ignore_patterns = {
            "node_modules/",
            ".next/",
            "dist/",
            "out/",
            ".git/",
            "vendor/",
            "bin/",
            "__pycache__/",
            "%.pyc",
            "%.pyo",
            ".venv/",
            "env/",
            ".mypy_cache/",
            "build/",
            "coverage/",
        },
    },
    pickers = {
        find_files = {
            -- Disable previewer for faster loading in large projects
            previewer = false,
        },
        git_files = {
            previewer = false,
        },
        buffers = {
            previewer = false,
        },
    },
    extensions = {
        fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
        },
    },
}

-- Load extensions
require('telescope').load_extension('fzf')
-- Uncomment if you want file_browser
-- require('telescope').load_extension('file_browser')
