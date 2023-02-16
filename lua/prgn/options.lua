-- options.lua

-- Clipboard --

-- Integrate system clipboard
vim.opt.clipboard:append("unnamedplus")

-- Completion --

-- Configure completion
vim.opt.completeopt = { "menuone", "noselect", "preview" }

-- Case insensitive searching unless /C or capital in search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Maximum completion menu height
vim.opt.pumheight = 8

-- Maximum completion menu width
vim.opt.pumwidth = 20

-- Formatting --

-- Enable `treesitter' folding
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"

-- Enable automatic folding (Current configuration is a bit buggy)
--vim.opt.foldclose = "all"
--vim.opt.foldopen = "all"

-- Disable automatic comment insertion
local format_group = vim.api.nvim_create_augroup("Formatting", {
 clear = true
})
vim.api.nvim_create_autocmd("BufEnter", {
  group = format_group,
  pattern = "*",
  callback = function()
    vim.cmd("set formatoptions-=cro")
  end
})

-- Indentation --

-- Preserve indent from previous line
vim.opt.autoindent = true

-- Number of spaces in tab
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.tabstop = 2

-- Replace tabs for spaces
vim.opt.expandtab = true

-- Round to indentations `shiftwidth` multiple
vim.opt.shiftround = true

-- Performance --

-- Decrease update time
vim.opt.updatetime = 250

-- Search --

-- Enable highlight on search
vim.opt.hlsearch = false

-- Undo --

-- Persist undo history
vim.opt.undofile = true

-- Create backup before overwriting file
vim.opt.backup = false

-- List of directories for undo files
vim.opt.undodir = vim.fn.stdpath("config") .. "/.local/etc/undo//"

-- User Interface --

-- Enable 24-bit colour
vim.opt.termguicolors = true

-- Enable sign column
vim.wo.signcolumn = "yes"

-- Disable all annoying error indicators
vim.opt.errorbells = false
vim.opt.visualbell = false
vim.opt.belloff = "all"

-- Display statusline
vim.opt.laststatus = 3

-- Display line numbers
vim.opt.number = true

-- Initial line number margin width
vim.opt.numberwidth = 3

-- Display relative line numbers
vim.opt.relativenumber = false

-- Display cursor position below each window
vim.opt.ruler = false

-- Display commands
vim.opt.showcmd = false

-- Display editing mode
vim.opt.showmode = false

-- Wrap long lines
vim.opt.wrap = false

-- Enable highlighting on yank
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = "*",
})

-- Miscellaneous --

-- Print dialog when command fails
vim.opt.confirm = true

-- Minimum number of screen lines around cursor
vim.opt.scrolloff = 8

-- Directory to save files create by `:mkview`
vim.opt.viewdir = vim.fn.stdpath("config") .. "/.local/etc/view//"

-- options.lua ends here
