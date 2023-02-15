-- lazy.lua

local lazypath = vim.fn.stdpath("config") .. "/.local/lazy/lazy.nvim"

-- Clone `lazy.nvim' if not already cloned into the correct location
if not vim.loop.fs_stat(lazypath) then
  print("Cloning `lazy'...")
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath
  })
  print("`lazy' cloned successfully!")
end

-- Add `lazy.nvim' location to runtime path
vim.opt.rtp:prepend(lazypath)

-- List of `lazy' plugins
local plugins = {
  -- Syntax --

  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      local parserpath = vim.fn.stdpath("config") .. "/.local/parsers"

      -- IMPORTANT: `prepend' instead of `append'
      vim.opt.runtimepath:prepend(parserpath)
    end
  },

  -- LSP --

  { "neovim/nvim-lspconfig" },
  { "williamboman/mason.nvim" },
  { "williamboman/mason-lspconfig.nvim" },
  { "j-hui/fidget.nvim" },
  { "folke/neodev.nvim" },
  { "simrat39/symbols-outline.nvim" },

  -- Completion --

  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      { "hrsh7th/nvim-cmp" },
      { "hrsh7th/cmp-nvim-lsp" },
      { "hrsh7th/cmp-buffer" },
      { "hrsh7th/cmp-path" },
      { "saadparwaiz1/cmp_luasnip" },
      { "hrsh7th/cmp-nvim-lua" }
    }
  },

  -- Snippets --

  { "L3MON4D3/LuaSnip" },
  { "rafamadriz/friendly-snippets" },

  -- Theme --

  {
    "rose-pine/neovim",
    name = "rose-pine"
  },

  -- Status Line --

  {
    "nvim-lualine/lualine.nvim",
    event = "ColorScheme"
  },

  -- Git --

  { "lewis6991/gitsigns.nvim" },

  -- Telescope --

  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-file-browser.nvim"
    }
  },

  -- Formatting --

  { "anuvyklack/pretty-fold.nvim" }
}

-- List of `lazy' options
local options = {
  root = vim.fn.stdpath("config") .. "/.local/lazy"
}

-- Setup `lazy' and additional plugins
require("lazy").setup(plugins, options)

-- lazy.lua ends here
