" For coc config

if isdirectory(expand('~/.vim/plugged/coc.nvim'))
  
  " Give more space for displaying messages.
  set cmdheight=2

  " Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
  " delays and poor user experience.
  set updatetime=300

  " Don't pass messages to |ins-completion-menu|.
  set shortmess+=c

  " Always show the signcolumn
  set signcolumn=yes

  " Use tab for trigger completion with characters ahead and navigate.
  " Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin 
  inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
  inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

  function! s:check_back_space() abort
      let col = col('.') - 1
      return !col || getline('.')[col - 1]  =~# '\s'
  endfunction

  
  " Make <CR> auto-select the first completion item and notify coc.nvim to
  " format on enter, <cr> could be remapped by other vim plugin
  inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

  " Use `[g` and `]g` to navigate diagnostics
  " 進入下一個診斷
  nmap <silent> [g <Plug>(coc-diagnostic-prev)
  " 進入上一個診斷
  nmap <silent> ]g <Plug>(coc-diagnostic-next)

  " 進入下一個定義
  nmap <silent> gd <Plug>(coc-definition)
  nmap <silent> gy <Plug>(coc-type-definition)
  nmap <silent> gi <Plug>(coc-implementation)
  nmap <silent> gr <Plug>(coc-references)

  " Use gh to show documentation in preview window.
  " 查看定義的樣子
  nnoremap <silent> gh :call <SID>show_documentation()<CR>

  function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
      execute 'h '.expand('<cword>')
    elseif (coc#rpc#ready())
      call CocActionAsync('doHover')
    else
      execute '!' . &keywordprg . " " . expand('<cword>')
    endif
  endfunction

  " Highlight the symbol and its references when holding the cursor.
  autocmd CursorHold * silent call CocActionAsync('highlight')

  " Symbol renaming.
  nmap <leader>rn <Plug>(coc-rename)

  " Formatting selected code.
  xmap <leader>f  <Plug>(coc-format-selected)
  nmap <leader>f  <Plug>(coc-format-selected)

  augroup mygroup
    autocmd!
    " Setup formatexpr specified filetype(s).
    autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
    " Update signature help on jump placeholder.
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
  augroup end


  " Add `:Format` command to format current buffer.
  command! -nargs=0 Format :call CocAction('format')

  " Add `:Fold` command to fold current buffer.
  command! -nargs=? Fold :call     CocAction('fold', <f-args>)

  " Add `:OR` command for organize imports of the current buffer.
  command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')


  " 浮動資料夾視窗設定
  let g:coc_explorer_global_presets = {
  \   '.vim': {
  \     'root-uri': '~/.vim',
  \   },
  \   'cocConfig': {
  \      'root-uri': '~/.config/coc',
  \   },
  \   'tab': {
  \     'position': 'tab',
  \     'quit-on-open': v:true,
  \   },
  \   'floating': {
  \     'position': 'floating',
  \     'open-action-strategy': 'sourceWindow',
  \   },
  \   'floatingTop': {
  \     'position': 'floating',
  \     'floating-position': 'center-top',
  \     'open-action-strategy': 'sourceWindow',
  \   },
  \   'floatingLeftside': {
  \     'position': 'floating',
  \     'floating-position': 'left-center',
  \     'floating-width': 50,
  \     'open-action-strategy': 'sourceWindow',
  \   },
  \   'floatingRightside': {
  \     'position': 'floating',
  \     'floating-position': 'right-center',
  \     'floating-width': 50,
  \     'open-action-strategy': 'sourceWindow',
  \   },
  \   'simplify': {
  \     'file-child-template': '[selection | clip | 1] [indent][icon | 1] [filename omitCenter 1]'
  \   },
  \   'buffer': {
  \     'sources': [{'name': 'buffer', 'expand': v:true}]
  \   },
  \ }


  " Using CoCList
  " 顯示全部的問題
  "nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
  "" 顯示coc全部的套件
  "nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
  "" 顯示全部的cmd指令
  "nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
  "" 取得該檔案的 outline
  "nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
  "" Search workspace symbols.
  "nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
  "" Do default action for next item.
  "nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
  "" Do default action for previous item.
  "nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
  "" Resume latest coc list.
  "nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

  " Using CocFzFList
  nnoremap <silent> <space><space> :<C-u>CocFzfList<CR>
  " 顯示所有的問題診斷
  nnoremap <silent> <space>a       :<C-u>CocFzfList diagnostics <CR>
  " 顯示所有的問題診斷 在這個檔案
  nnoremap <silent> <space>b       :<C-u>CocFzfList diagnostics --current-buf<CR>
  " 顯示所有指令
  nnoremap <silent> <space>c       :<C-u>CocFzfList commands<CR>
  " 顯示所有插件
  nnoremap <silent> <space>e       :<C-u>CocFzfList extensions<CR>
  "nnoremap <silent> <space>l       :<C-u>CocFzfList location<CR>
  " 取得該檔案的 outline
  nnoremap <silent> <space>o       :<C-u>CocFzfList outline<CR>
  nnoremap <silent> <space>s       :<C-u>CocFzfList symbols<CR>
  nnoremap <silent> <space>g       :<C-u>CocFzfList --normal gstatus<CR>
  " Resume latest coc list
  nnoremap <silent> <space>p       :<C-u>CocFzfListResume<CR>

  " 查詢實做的interface func 
  nnoremap <silent> <space>i       :<C-u>CocCommand fzf-preview.CocImplementations<CR>
  " 查詢git狀態
  nnoremap <silent> <space>gs    :<C-u>CocCommand fzf-preview.GitStatus<CR>
  " 查詢git的動作
  nnoremap <silent> <space>ga    :<C-u>CocCommand fzf-preview.GitActions<CR>

  " 開啟資料夾
  " 左邊那排
  nmap <space>e :CocCommand explorer <cr>
  " 浮動視窗
  nmap <space>ef :CocCommand explorer --preset floating<CR>

  " other
  "nmap <space>ed :CocCommand explorer --preset .vim<CR>
  "nmap <space>ef :CocCommand explorer --preset floating<CR>
  "nmap <space>ec :CocCommand explorer --preset cocConfig<CR>
  "nmap <space>eb :CocCommand explorer --preset buffer<CR>

  " 不知道放哪的coc設定
  " Use <c-space> to trigger completion.
  if has('nvim')
    inoremap <silent><expr> <c-space> coc#refresh()
  else
    inoremap <silent><expr> <c-@> coc#refresh()
  endif

  " Applying codeAction to the selected region.
  " Example: `<leader>aap` for current paragraph
  xmap <leader>a  <Plug>(coc-codeaction-selected)
  nmap <leader>a  <Plug>(coc-codeaction-selected)

  " Remap keys for applying codeAction to the current buffer.
  nmap <leader>ac  <Plug>(coc-codeaction)
  " Apply AutoFix to problem on the current line.
  nmap <leader>qf  <Plug>(coc-fix-current)

  " Map function and class text objects
  " NOTE: Requires 'textDocument.documentSymbol' support from the language server.
  xmap if <Plug>(coc-funcobj-i)
  omap if <Plug>(coc-funcobj-i)
  xmap af <Plug>(coc-funcobj-a)
  omap af <Plug>(coc-funcobj-a)
  xmap ic <Plug>(coc-classobj-i)
  omap ic <Plug>(coc-classobj-i)
  xmap ac <Plug>(coc-classobj-a)
  omap ac <Plug>(coc-classobj-a)

  " Remap <C-f> and <C-b> for scroll float windows/popups.
  if has('nvim-0.4.0') || has('patch-8.2.0750')
    nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
    nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
    inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
    inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
    vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
    vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  endif

  " Use CTRL-S for selections ranges.
  " Requires 'textDocument/selectionRange' support of language server.
  nmap <silent> <C-s> <Plug>(coc-range-select)
  xmap <silent> <C-s> <Plug>(coc-range-select)

  " Add (Neo)Vim's native statusline support.
  " NOTE: Please see `:h coc-status` for integrations with external plugins that
  " provide custom statusline: lightline.vim, vim-airline.
  set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

endif
