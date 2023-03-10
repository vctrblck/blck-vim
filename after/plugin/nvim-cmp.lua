-- nvim-cmp.lua

local cmp = require("cmp")
local luasnip = require("luasnip")

local has_words_before = function()
  unpack = unpack or table.unpack
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

cmp.setup {
  completion = { autocomplete = false },
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = require("cmp").mapping.preset.insert({
    ["<C-k>"] = require("cmp").mapping.scroll_docs(-4),
    ["<C-j>"] = require("cmp").mapping.scroll_docs(4),
    ["C-Space>"] = require("cmp").mapping.complete(),
    ["<C-q>"] = require("cmp").mapping.abort(),
    ["<CR>"] = require("cmp").mapping.confirm({ select = false }),
    ["<Tab>"] = require("cmp").mapping(function(fallback)
      if require("cmp").visible() then
        require("cmp").select_next_item()
      elseif require("luasnip").expand_or_jumpable() then
        require("luasnip").expand_or_jump()
      elseif has_words_before() then
        require("cmp").complete()
      else
        fallback()
      end
    end, { "i", "s" }),
    ["<S-Tab>"] = require("cmp").mapping(function(fallback)
      if require("cmp").visible() then
        require("cmp").select_prev_item()
      elseif require("luasnip").jumpable(-1) then
        require("luasnip").jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),
  }),
  sources = require("cmp").config.sources({
    { name = "nvim_lsp" },
    { name = "luasnip" },
    { name = "path" }
  }, {
    { name = "buffer" }
  })
}

-- nvim-cmp.lua ends here
