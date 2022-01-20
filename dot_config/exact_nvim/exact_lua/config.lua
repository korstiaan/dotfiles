vim.g.mapleader=','

-- -- visuals
vim.o.termguicolors=true
vim.cmd('colorscheme codedark')
vim.cmd('syntax enable')

-- -- misc
vim.o.title=true

vim.o.showmatch=true  -- show matching brackets
vim.o.number=true     -- show line number
vim.o.spelllang='en'
vim.o.showcmd=true    -- display current cmd in left corner
vim.o.history=1000
vim.o.autoread=true   -- auto reload when changes are detected
vim.o.mouse='a'       -- enable mouse in all modes
vim.o.ttyfast=true

vim.o.backup=false
vim.o.swapfile=false

vim.o.completeopt="menu,menuone,noselect"

-- -- searching
vim.o.matchtime=0
vim.o.incsearch=true        -- enable incremental search
vim.o.hlsearch=true         -- highlight search
vim.o.ignorecase=true
vim.o.inccommand='nosplit'  -- show substitutions on the fly
vim.o.smartcase=true

-- -- indenting
vim.o.expandtab=true  -- use spaces when tabbing
vim.o.tabstop=2       -- display tabs as 2 spaces
vim.o.softtabstop=4   -- pressing tab is 2 spaces
vim.o.shiftwidth=2    -- indenting is 2 spaces
vim.o.autoindent=true
vim.o.backspace="indent,eol,start"
