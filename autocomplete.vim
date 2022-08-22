" Disable docstring poping up (annoying)
set completeopt-=preview
" auto select feature
set completeopt+=noinsert

" == yaml ==
" if we don't set this we get from ftplugin/yaml.vim
" setlocal shiftwidth=2 softtabstop=2
let g:yaml_recommended_style=0

" == Enable deoplete ==
let g:deoplete#enable_at_startup = 1

call deoplete#custom#option({
\ 'max_list': 20,
\ 'smart_case': v:true,
\ 'min_pattern_length': 1,
\ })

" == jedi-vim ==
"let g:jedi#completions_enabled = 0
"let g:jedi#auto_vim_configuration = 0
"let g:jedi#smart_auto_mappings = 0
"let g:jedi#popup_on_dot = 0
"let g:jedi#show_call_signatures = 0
let g:jedi#usages_command = "<leader>u"  " disable because of vim-mark

" == enable ==
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
"autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType python setlocal omnifunc=jedi#completions
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType sql setlocal omnifunc=sqlcomplete#CompleteTags
autocmd FileType cpp setlocal omnifunc=ccomplete#Complete
