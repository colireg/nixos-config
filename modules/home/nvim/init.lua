vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.wrap = false

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true
vim.opt.undodir = os.getenv('HOME') .. '/.vim/undodir'

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.g.mapleader = ' '
vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)

vim.keymap.set('v', 'J', ':m \'>+1<CR>gv=gv')
vim.keymap.set('v', 'K', ':m \'<-2<CR>gv=gv')

-- Obsidian
require("obsidian").setup({
    workspaces = {
        {
            name = "markdown",
            path = "~/markdown",
        }
    },
    disable_frontmatter = true,
    ui = { enable = false }
})
vim.keymap.set('n', '<leader>.', vim.cmd.ObsidianToday)
vim.keymap.set('n', '<leader>on', vim.cmd.ObsidianNew)
vim.keymap.set('n', '<leader>of', vim.cmd.ObsidianQuickSwitch)
vim.keymap.set('n', '<leader>os', vim.cmd.ObsidianSearch)
vim.keymap.set('n', '<leader>ot', vim.cmd.ObsidianToday)
vim.keymap.set('n', '<leader>ob', vim.cmd.ObsidianBacklinks)
