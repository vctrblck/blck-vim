-- keymaps.lua

local options = { silent = true, noremap = true }

-- Set <Leader> key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Set convient NORMAL mode exit
vim.keymap.set("i", "jk", "<Escape>", options)

-- Launch Netrw
vim.keymap.set("n", "<Leader>fvf", vim.cmd.Ex)

-- Find file
vim.keymap.set("n", "<Leader>fff", require("telescope.builtin").find_files, {})

-- Find `git' file
vim.keymap.set("n", "<Leader>ffg", require("telescope.builtin").git_files, {})

-- Find `git' file
vim.keymap.set("n", "<Leader>ffr", require("telescope.builtin").oldfiles, {})

-- Find buffer
vim.keymap.set("n", "<Leader>bfb", require("telescope.builtin").buffers, {})

-- Find help (based on a tag)
vim.keymap.set("n", "<Leader>hfs", require("telescope.builtin").help_tags, {})

-- Find text
vim.keymap.set("n", "<Leader>tfs", function()
  require("telescope.builtin").grep_string({ search = vim.fn.input("Grep: ") })
end)

-- View buffer symbols outline
vim.keymap.set("n", "<Leader>svs", ":SymbolsOutline<CR>")

-- View project version control status
--vim.keymap.set("n", "<Leader>pvs", require("neogit").open)

-- Split window vertically
vim.keymap.set("n", "<Leader>ws|", ":vsplit<CR>")

-- Split window horizontally
vim.keymap.set("n", "<Leader>ws-", ":split<CR>")

-- Rename symbol
vim.keymap.set("n", "<Leader>scs", function() vim.lsp.buf.rename() end, options)

-- Find symbol definition
vim.keymap.set("n", "<Leader>sfd", function() vim.lsp.buf.definition() end, options)

-- Find symbol references
vim.keymap.set("n", "<Leader>sfr", function() require("telescope.builtin").lsp_references() end, options)

-- View workspace symbols
vim.keymap.set("n", "<Leader>sfs", function() require("telescope.builtin").lsp_dynamic_workspace_symbols() end, options)

-- View suggested symbol actions
vim.keymap.set("n", "<Leader>sva", function() vim.lsp.buf.code_action() end, options)

-- View symbol documentation
vim.keymap.set("n", "<Leader>svh", function() vim.lsp.buf.hover() end, options)

-- View diagnostics
vim.keymap.set("n", "<Leader>pvd", function() require("telescope.builtin").diagnostics() end, options)

-- keymaps.lua ends here
