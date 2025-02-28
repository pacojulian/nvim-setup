require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  ensure_installed = {
    "javascript", "typescript", "c", "lua", "rust", "java", "go", "python",
    "bash", "json", "yaml", "toml", "html", "css", "regex", "query",
    "comment", "cpp", "cmake", "dockerfile", "php", "ruby", "scss",
    "tsx", "vue", "svelte"
  },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  auto_install = true,

  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },

  autotag = {
    enable = true,
  }
}
