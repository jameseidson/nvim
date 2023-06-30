local opt = vim.opt

opt.nu = true
opt.relativenumber = true
opt.numberwidth = 5
opt.cursorline = true
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.shiftround = true
opt.expandtab = true
opt.smartindent = true
opt.wrap = false
opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true
opt.hlsearch = false
opt.incsearch = true
opt.ignorecase = true
opt.termguicolors = true
opt.background = "dark"
opt.scrolloff = 1024
opt.sidescrolloff = 0
opt.signcolumn = "yes"
opt.isfname:append("@-@")
opt.updatetime = 200

vim.diagnostic.config({ update_in_insert = true })
