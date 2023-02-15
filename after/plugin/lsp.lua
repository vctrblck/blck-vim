-- lsp.lua


local servers = {
  --"arduino_language_server", -- Arduino
  --"asm_lsp", -- Assembly
  bashls = {}, -- Bash

  -- NOTE: If using Ubuntu, run `sudo apt install libstdc++-12-dev' to get
  -- clangd working
  clangd = {}, -- C/C++

  --"cmake", -- CMake
  cssls = {}, -- CSS
  graphql = {}, -- GraphQL
  html = {}, -- HTML
  --"jdtls", -- Java
  --"kotlin_language_server", -- Kotlin
  --"nil_ls", -- Nix
  --"powershell_es", -- Powershell
  pylsp = {}, -- Python
  --"rust_analyzer", -- Python
  --"sqlls", -- SQL
  lua_ls= {
    Lua = {
      runtime = {
        version = "LuaJIT"
      },
      diagnostics = { globals = "vim" },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true)
      },
      telemetry = { enable = false }
    }
  }, -- Lua
  tailwindcss = {}, -- Tailwind
  --"terraformls", -- Terraform
  --"texlab", -- LaTex
  tsserver = {}, -- JavaScript/TypeScript
}

-- NOTE: Perhaps assignment/return value not as important. Probably computes an
-- important procedure
local capabilities = vim.lsp.protocol.make_client_capabilities()

require("mason").setup()

require("mason-lspconfig").setup({
  ensure_installed = vim.tbl_keys(servers)
})

require("mason-lspconfig").setup_handlers({
  function(server_name)
    require("lspconfig")[server_name].setup({
      -- Enable LSP completions
      capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities),
      -- on_attach = on_attach,
      settings = servers[server_name]
    })
  end
})

-- Hide diagnostic UI
vim.diagnostic.config({
  virtual_text = false,
  signs = true,
  underline = false
})

require("fidget").setup()

-- lsp.lua
