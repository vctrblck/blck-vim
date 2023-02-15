-- treesitter.lua

require("nvim-treesitter.configs").setup({
  -- A list of parser names, or "all" (the four listed parsers should always be installed)
  ensure_installed = {
    "arduino",
    "bash",
    "c",
    "cmake",
    "comment",
    "commonlisp",
    "cpp",
    "css",
    "cuda",
    "diff",
    "dockerfile",
    "graphql",
    "help",
    "html",
    "http",
    "java",
    "javascript",
    "json",
    "kotlin",
    "latex",
    "lua",
    "make",
    "markdown",
    "nix",
    "perl",
    "php",
    "python",
    "rust",
    "scala",
    "scheme",
    "solidity",
    -- "sql",
    "svelte",
    "terraform",
    "toml",
    "tsx",
    "typescript",
    "verilog",
    "vim",
    "vue",
    "yaml"
  },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = false,

  -- List of parsers to ignore installing (for "all")
  ignore_install = {},

  -- Installation directory for parsers (see "Advanced Setup")
  parser_install_dir = vim.fn.stdpath("config") .. "/.local/parsers",

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
    -- the name of the parser)
    -- list of language that will be disabled
    disable = {},
  },
})

-- treesitter.lua ends here
