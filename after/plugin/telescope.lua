local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.git_files, {})
vim.keymap.set('n', '<leader>fs', function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)
vim.keymap.set('n', '<leader>fd', builtin.lsp_definitions, {})
require('telescope').setup {
    defaults = {
        file_ignore_patterns = { "node_modules" }
    },
    extensions = {
        lsp_handlers = {
            lsp_handlers = {
                code_action = {
                    telescope = require('telescope.themes').get_dropdown({}),
                },
            },
            location = {
                telescope = {},
                no_results_message = 'No references found',
            },
            symbol = {
                telescope = {},
                no_results_message = 'No symbols found',
            },
            call_hierarchy = {
                telescope = {},
                no_results_message = 'No calls found',
            },
            code_action = {
                telescope = {},
                no_results_message = 'No code actions available',
                prefix = '',
            },
        },
    }
}
