" init.vim => neovim init

if filereadable(expand('~/.config/nvim/config/plug.vim'))
  " import base 
  source ~/.config/nvim/config/plug.vim
  source ~/.config/nvim/config/setting.vim

  " import vim-go config
  if filereadable(expand('~/.config/nvim/config/vim-go.vim'))
    source ~/.config/nvim/config/vim-go.vim
  endif

  " import vim-ruby config
  if filereadable(expand('~/.config/nvim/config/vim-ruby.vim'))
    source ~/.config/nvim/config/vim-ruby.vim
  endif

  " import ag config
  if filereadable(expand('~/.config/nvim/config/ag.vim'))
    source ~/.config/nvim/config/ag.vim
  endif

  " import coc-vim config
  if filereadable(expand('~/.config/nvim/config/coc.vim'))
    source ~/.config/nvim/config/coc.vim
  endif
endif
