" For vim-ruby config - ruby

if isdirectory(expand('~/.vim/plugged/vim-go'))
  " Operator highlighting 
  let ruby_operators        = 1
  let ruby_pseudo_operators = 1

  let g:ruby_recommended_style = 1
  let g:ruby_indent_access_modifier_style = 'indent'
  let g:ruby_indent_assignment_style = 'variable'
  

  let ruby_space_errors = 1
  let ruby_line_continuation_error = 1
  let ruby_global_variable_error   = 1
  let ruby_spellcheck_strings = 1
  let g:coc_global_extensions = ['coc-solargraph']
endif

