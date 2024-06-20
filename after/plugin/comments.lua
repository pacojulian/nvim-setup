require('nvim_comment').setup({
    line_mapping = "<leader>cl",
    operator_mapping = "<leader>c",
    comment_chunk_text_object = "ic",

},
    {
        comment_empty = false,
        create_mappings = false,
        hook = function()
            require("ts_context_commentstring.internal").update_commentstring()
        end
    }
)
