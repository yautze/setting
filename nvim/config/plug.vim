" Plug.vim => for plug

" set dir_path
let s:plug_dir = '~/.vim/plugged'

call plug#begin(s:plug_dir)

  " ColorSchema
  Plug 'joshdick/onedark.vim'

  " Golang
  Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' , 'for':'go'}
  Plug 'tweekmonster/hl-goimport.vim', { 'for': 'go' }

  " Ruby
  Plug 'tpope/vim-rails'

  " EasyMotion - 快速移動
  Plug 'easymotion/vim-easymotion'

  " Importain
  " 快速註解  
  Plug 'preservim/nerdcommenter'
  " 快速補齊雙引號
  Plug 'tpope/vim-surround'
  
  " devi-cons => file icon
  Plug 'ryanoasis/vim-devicons'

  " coc 
  Plug 'neoclide/coc.nvim' , {'branch':'release'}
  Plug 'josa42/vim-lightline-coc'

  " emoji 
  Plug 'junegunn/vim-emoji'  

  " FZF
  Plug 'junegunn/fzf.vim' 
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'yuki-yano/fzf-preview.vim', { 'branch': 'release/rpc' }
  Plug 'antoinemadec/coc-fzf', {'branch': 'release'}

  " AG search
  Plug 'rking/ag.vim'

  " other
  Plug 'itchyny/lightline.vim'
  Plug 'tpope/vim-fugitive'

call plug#end()
