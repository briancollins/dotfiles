-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Leader must be set before lazy
vim.g.mapleader = ","

-- Plugins
require("lazy").setup({
  { "junegunn/fzf", build = ":call fzf#install()" },
  { "junegunn/fzf.vim" },
  { "airblade/vim-rooter" },
  { "ntpeters/vim-better-whitespace" },
  { "tpope/vim-surround" },
  { "tpope/vim-repeat" },
  { "tpope/vim-fugitive" },
  { "neoclide/coc.nvim", branch = "release" },
  { "evanleck/vim-svelte", branch = "main" },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = {
      ensure_installed = {
        "javascript", "typescript", "tsx", "html", "css",
        "json", "lua", "rust", "ruby", "svelte", "bash",
      },
      highlight = { enable = true },
    },
  },
  {
    "coder/claudecode.nvim",
    dependencies = { "folke/snacks.nvim" },
    config = true,
  },
  {
    "morhetz/gruvbox",
    priority = 1000,
    config = function()
      vim.g.gruvbox_contrast_dark = "medium"
      vim.cmd.colorscheme("gruvbox")
    end,
  },
})

-- Settings
vim.opt.visualbell = false
vim.opt.errorbells = false
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false

vim.opt.completeopt = { "longest", "menuone" }

vim.opt.wildignore:append({ ".git", "node_modules", "tmp" })
vim.opt.wildmode = { "longest", "list", "full" }

vim.opt.listchars = { tab = "▸ " }
vim.opt.list = true

vim.opt.number = true
vim.opt.showmatch = true
vim.opt.colorcolumn = "81"
vim.opt.signcolumn = "yes"

local colorterm = os.getenv("COLORTERM")
if colorterm == "truecolor" or colorterm == "24bit" then
  vim.opt.termguicolors = true
end
vim.opt.background = "dark"

vim.g.netrw_dirhistmax = 0

vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.softtabstop = 2

-- Plugin settings
vim.g.coc_global_extensions = { "coc-tsserver", "coc-eslint", "coc-json", "coc-rust-analyzer" }
vim.g.svelte_preprocessors = { "typescript" }

-- Keymaps
vim.keymap.set("n", "<C-L>", "<cmd>nohl<CR><C-L>")
vim.keymap.set("i", "jj", "<Esc>")

vim.keymap.set("n", "<leader><leader>", "<cmd>b#<CR>")

vim.keymap.set("n", "<leader>a", ":Rg ")
vim.keymap.set("n", "<leader>t", "<cmd>tabnew<CR>")
vim.keymap.set("n", "<leader>f", "<cmd>call CocAction('format')<CR>")
vim.keymap.set("n", "<leader>r", ":Rg ")

vim.keymap.set("n", "<leader>sh", "<cmd>leftabove vnew<CR>")
vim.keymap.set("n", "<leader>sl", "<cmd>rightbelow vnew<CR>")
vim.keymap.set("n", "<leader>sk", "<cmd>leftabove new<CR>")
vim.keymap.set("n", "<leader>sj", "<cmd>rightbelow new<CR>")

vim.keymap.set("n", "<leader>swh", "<cmd>topleft vnew<CR>")
vim.keymap.set("n", "<leader>swl", "<cmd>botright vnew<CR>")
vim.keymap.set("n", "<leader>swk", "<cmd>topleft new<CR>")
vim.keymap.set("n", "<leader>swj", "<cmd>botright new<CR>")

vim.keymap.set("n", "<leader>v", "<cmd>e ~/.config/nvim/init.lua<CR>")
vim.keymap.set("n", "<C-p>", "<cmd>Files<CR>")

-- Terminal mode: pass Ctrl-w commands through to Neovim
vim.keymap.set("t", "<C-w>h", "<C-\\><C-n><C-w>h")
vim.keymap.set("t", "<C-w>j", "<C-\\><C-n><C-w>j")
vim.keymap.set("t", "<C-w>k", "<C-\\><C-n><C-w>k")
vim.keymap.set("t", "<C-w>l", "<C-\\><C-n><C-w>l")
vim.keymap.set("t", "<C-w><C-w>", "<C-\\><C-n><C-w><C-w>")
vim.keymap.set("t", "<C-w>w", "<C-\\><C-n><C-w>w")
vim.keymap.set("t", "<C-w>q", "<C-\\><C-n><C-w>q")
vim.keymap.set("t", "<C-w>c", "<C-\\><C-n><C-w>c")
vim.keymap.set("t", "<C-w>o", "<C-\\><C-n><C-w>o")
vim.keymap.set("t", "<C-w>s", "<C-\\><C-n><C-w>s")
vim.keymap.set("t", "<C-w>v", "<C-\\><C-n><C-w>v")
vim.keymap.set("t", "<C-w>=", "<C-\\><C-n><C-w>=")
vim.keymap.set("t", "<C-w>+", "<C-\\><C-n><C-w>+")
vim.keymap.set("t", "<C-w>-", "<C-\\><C-n><C-w>-")
vim.keymap.set("t", "<C-w>>", "<C-\\><C-n><C-w>>")
vim.keymap.set("t", "<C-w><", "<C-\\><C-n><C-w><")
vim.keymap.set("t", "<C-w>H", "<C-\\><C-n><C-w>H")
vim.keymap.set("t", "<C-w>J", "<C-\\><C-n><C-w>J")
vim.keymap.set("t", "<C-w>K", "<C-\\><C-n><C-w>K")
vim.keymap.set("t", "<C-w>L", "<C-\\><C-n><C-w>L")
vim.keymap.set("t", "<C-w>T", "<C-\\><C-n><C-w>T")

vim.filetype.add({ filename = { [".bash_profile"] = "bash" } })

-- Autocmds
local augroup = vim.api.nvim_create_augroup("UserConfig", { clear = true })

vim.api.nvim_create_autocmd("FileType", {
  group = augroup,
  pattern = "*",
  callback = function()
    vim.opt_local.shiftwidth = 2
    vim.opt_local.tabstop = 2
    vim.opt_local.softtabstop = 2
    vim.opt_local.expandtab = true
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  group = augroup,
  pattern = "rust",
  callback = function()
    vim.opt_local.shiftwidth = 4
    vim.opt_local.tabstop = 4
    vim.opt_local.softtabstop = 4
  end,
})
