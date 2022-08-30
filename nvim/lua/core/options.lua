-- # custom setting for neovim

local opts = {
  -- base
  hidden = true,             -- 允許切換檔案時不儲存
  clipboard = "unnamedplus", -- 允許使用複製貼上
  cmdheight = 1,             -- command line height
  completeopt = { "menuone,noinsert" },
  conceallevel = 0,          -- conceal level (0-3) (default: 2) (0: no concealing) (1: conceal only cursor line) (2: conceal cursor line and cursor column) (3: conceal all) (4: conceal cursor line and cursor column and all empty lines)
  undolevels = 1000,
  undoreload = 1000,
  updatetime = 300,
  timeoutlen = 500,
  expandtab = true,
  shiftwidth = 2,
  tabstop = 2,
  softtabstop = 2,
  history = 1000,
  virtualedit = "block",

  -- file
  backup = false,            
  writebackup = false,       
  undofile = true,         
  swapfile = false,

  -- encoding
  encoding = "utf-8",
  fileencoding = "utf-8",

  -- search
  hlsearch = true,           -- highlight search
  ignorecase = true,
  smartcase = true,

  -- neovim gui
  syntax = "on",
  background = "dark",
  tabpagemax = 15,           -- 最多幾個分頁
  showmode = true,           -- 顯示目前在哪個vim模式
  showcmd = true,            -- 顯示command
  showmatch = true,
  showtabline = 4,
  lazyredraw = true,
  pumheight = 10,            -- popup menu height
  smartindent = true,
  cursorline = false,        -- cursor line highlight
  number = true,             -- 顯示行號
  numberwidth = 1,
  signcolumn = "yes",
  wrap = false,              -- no wrap
  scrolloff = 8,
  sidescrolloff = 8,
  ruler = true,
  rulerformat = " %l : %c %p%% %m %t",

  -- split window layout
  splitbelow = true,        -- 向下分割視窗
  splitright = true,        -- 向右分割視窗
}

-- 將上面的json轉為設定
for k , v in pairs(opts) do
  vim.opt[k] = v
end

vim.api.nvim_set_option('cursorline', true)

-- 自動偵測檔案
vim.api.nvim_command('filetype plugin indent on')
vim.api.nvim_exec([[let g:loaded_perl_provider = 0]],false)
