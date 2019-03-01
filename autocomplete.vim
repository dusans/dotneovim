" Disable docstring poping up (annoying)
set completeopt-=preview

" Q I want to use the auto select feature like |neocomplete|.
" A You can use it by the 'completeopt' option. >
set completeopt+=noinsert

" Enable deoplete at startup
let g:deoplete#enable_at_startup = 1

" Use smartcase.
let g:deoplete#enable_smart_case = 1
let g:neocomplete#max_list=20  " Show up to this limit candidates.

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType python setlocal omnifunc=jedi#completions
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType sql setlocal omnifunc=sqlcomplete#CompleteTags
autocmd FileType cpp setlocal omnifunc=ccomplete#Complete

" = jedi-vim =
let g:jedi#usages_command = "<leader>u"  " disable because of vim-mark
