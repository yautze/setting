" init.vim => neovim init

if filereadable(expand('~/.config/nvim/config/plug.vim'))
  " import base 
   source ~/.config/nvim/config/plug.vim
   source ~/.config/nvim/config/setting.vim

  " import vim-go config
  if filereadable(expand('~/.config/nvim/config/vim-go.vim'))
    source ~/.config/nvim/config/vim-go.vim
  endif

  " import coc-vim config
  if filereadable(expand('~/.config/nvim/config/coc.vim'))
    source ~/.config/nvim/config/coc.vim
  endif

endif

