-- Search
vim.opt.hlsearch = true     -- Highlight search results
vim.opt.incsearch = true    -- Highlight all search results as you are typing
vim.opt.ignorecase = true   -- Ignore case for search

-- Input
vim.opt.backspace = "indent,eol,start" -- Enable backspacing over everything

-- Indentation
vim.opt.autoindent = true   -- New lines inherit previous lines' indentation
vim.opt.smartindent = true  -- Does the right thing (mostly) in programs
vim.opt.tabstop = 4         -- Set how many columns a tab should take visually
vim.opt.shiftwidth = 4      -- Set how many spaces for indentation
vim.opt.expandtab = true    -- Convert tabs to spaces

-- Interface
vim.opt.colorcolumn = "81"      -- Draw a line at the 81st character (included)
vim.opt.relativenumber = true   -- Show line numbers relative to current line
vim.opt.showcmd = true          -- Show commands entered
vim.opt.cursorline = true       -- Underline the current line
vim.opt.laststatus = 3          -- Always displays the status line
vim.opt.confirm = true          -- Always ask confirmation before oopsies
vim.opt.termguicolors = true    -- Enable 24-bit RGB colors
vim.opt.splitright = true       -- Open new :vsplit buffers to the right

-- Copy/Paste
vim.opt.clipboard = "unnamedplus"   -- Allow nvim to access system clipboard

-- Other
vim.opt.undofile = true             -- Enable persisten undo
vim.opt.undodir = os.getenv("HOME") .. "/.nvim_undodir" --  Undo files directory
vim.opt.updatetime = 300            -- Faster completion (4000ms default)
vim.opt.swapfile = false            -- Disable swap files
vim.opt.backup = false              -- Disable file backups
vim.opt.writebackup = false         -- Disable file backups
