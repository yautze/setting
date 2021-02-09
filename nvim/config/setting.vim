" Setting.vim => base setting

" base 
  set number                    " 設定行號
  set hidden                    " 允許切換時不儲存
  set clipboard=unnamed         " 允許使用複製貼上
  filetype plugin indent on     " 自動偵測檔案類型
  set encoding=utf-8
  scriptencoding utf-8


" formatting
  set nowrap            " Do not wrap long lines
  set smartindent
  set shiftwidth=2      " Use indents of 4 spaces
  set expandtab         " Tabs are spaces, not tabs
  set tabstop=4         " An indentation every four columns
  set softtabstop=4     " Let backspace delete indent
  set nojoinspaces      " Prevents inserting two spaces after punctuation on a join (J)
  set splitright        " Puts new vsplit windows to the right of the current
  set splitbelow        " Puts new split windows to the bottom of the current
  set autoindent   





" color-schema
  syntax on
  colorscheme onedark

" key mapping
  let mapleader =','          " set the key map leader
  let maplocalleader = '_'

  " Easier Moving
  map <C-J> <C-W>j<C-W>_
  map <C-K> <C-W>k<C-W>_
  map <C-L> <C-W>l<C-W>_
  map <C-H> <C-W>h<C-W>_

