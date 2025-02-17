local formatter = require("formatter")

formatter.setup({
  logging = false,
  filetype = {
    -- Python formatting using `black`
    python = {
      function()
        return {
          exe = "black",  -- The executable for the formatter
          args = { "-" }, -- Arguments to pass to the formatter
          stdin = true,
        }
      end,
    },

    -- Lua formatting using `stylua`
    lua = {
      function()
        return {
          exe = "stylua",
          args = { "--config-path", "/path/to/.stylua.toml", "-" },
          stdin = true,
        }
      end,
    },

    -- React (JavaScript/TypeScript) formatting using `prettier`
    javascript = {
      function()
        return {
          exe = "prettier",  -- The executable for the formatter
          args = { "--write", "--single-quote", "--trailing-comma", "all", "-" },
          stdin = true,
        }
      end,
    },
    typescript = {
      function()
        return {
          exe = "prettier",
          args = { "--write", "--single-quote", "--trailing-comma", "all", "-" },
          stdin = true,
        }
      end,
    },
    javascriptreact = {
      function()
        return {
          exe = "prettier",
          args = { "--write", "--single-quote", "--trailing-comma", "all", "-" },
          stdin = true,
        }
      end,
    },
    typescriptreact = {
      function()
        return {
          exe = "prettier",
          args = { "--write", "--single-quote", "--trailing-comma", "all", "-" },
          stdin = true,
        }
      end,
    },

    -- Go formatting using `gofmt` or `goimports`
    go = {
      function()
        return {
          exe = "gofmt",  -- You can also use "goimports" if you prefer
          args = { "-" },
          stdin = true,
        }
      end,
    },
  },
})

