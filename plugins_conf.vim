" == ultisnip ==
let g:UltiSnipsUsePythonVersion = 2
let g:UltiSnipsJumpForwardTrigger = "<c-n>"
let g:UltiSnipsJumpBackwardTrigger = "<c-p>"
let g:UltiSnipsSnippetDirectories=["UltiSnips", "ultisnips_my"]

nnoremap <F7> :call LoadUltisnips()<cr>:call UltiSnips_ListSnippets()<CR>
inoremap <F7> <esc>:call LoadUltisnips()<cr>a<c-r>=UltiSnips_ExpandSnippet()<cr>

" == session ==
map <F12> :mksession! $NEOVIM_MY/sessions/
map <S-F12> :source $NEOVIM_MY/sessions/

map <Leader>ss :mksession! $NEOVIM_MY/sessions/def.vim<CR>
map <F5> :source $NEOVIM_MY/sessions/def.vim<CR><Esc>:call GuiWindowFullScreen(1)<CR><CR>

" == rainbow ==
let g:rainbow#max_level = 8
let g:rainbow#pairs = [['(', ')'], ['[', ']']]

" always on
au VimEnter * RainbowParentheses!!
au Syntax * RainbowParentheses

" == indent_guides ==
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_guide_size = 4
let g:indent_guides_start_level = 2
let g:indent_guides_color_change_percent = 2
map <M-i> :IndentGuidesToggle<CR>

" == ctrlp ==
let g:ctrlp_map = '<A-p>'
let g:ctrlp_cmd = 'CtrlPMRUFiles'

let g:ctrlp_custom_ignore = {
    \ 'dir': '\v[\/]\.(git|hg|svn)$',
    \ 'file': '\v\.(exe|so|dll)$',
    \ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
    \ }

" == ctrl-extensions ==
let g:ctrlp_extensions = ['line', 'funky']
map <C-F> :CtrlPLine %<CR>

" = ctrlp-funky =
let g:ctrlp_funky_sort_by_mru = 1
let g:ctrlp_funky_syntax_highlight = 1
let g:ctrlp_funky_use_cache = 1
map <Leader>f :CtrlPFunky<CR>

" == signature ==
highlight SignColumn guibg=black  " column background color
let g:SignaturePrioritizeMarks = 0
let g:SignaturePeriodicRefresh = 0  " slow

" == statusline ==
source $NEOVIM_MY/statusline.vim

" == noscrollbar ==
function! Noscrollbar(...)
    "let w:airline_section_z = '%{noscrollbar#statusline()}'
    let w:airline_section_z = '%{noscrollbar#statusline(16,''—'',''█'')}'
    "let w:airline_section_z = '%{noscrollbar#statusline(20,'■','◫',['◧'],['◨'])}'
endfunction
call airline#add_statusline_func('Noscrollbar')

" == sneak ==
let g:sneak#use_ic_scs = 1 " smartcase
let g:sneak#streak = 1
let g:sneak#s_next = 1
let g:sneak#s2ws = 2
let g:sneak#dot2any = 1

nmap s <Plug>Sneak_s
nmap S <Plug>Sneak_S
xmap s <Plug>Sneak_s
xmap S <Plug>Sneak_S
omap s <Plug>Sneak_s
omap S <Plug>Sneak_S

nmap <Space> <Plug>Sneak_s
nmap <M-Space> <Plug>Sneak_S
xmap <Space> <Plug>Sneak_s
xmap <M-Space> <Plug>Sneak_S
omap <Space> <Plug>Sneak_s
omap <M-Space> <Plug>Sneak_S

" == nerdcommenter ==
let g:NERDCreateDefaultMappings = 0 " disable default mappings
map <Leader><Leader> <Plug>NERDCommenterToggle

" == yankring ==
nnoremap <silent> yy :YRShow<CR>

" == hardmode ==
let g:HardMode_hjklLimit = 3
let g:HardMode_disable_arrows = 0
autocmd VimEnter,BufNewFile,BufReadPost * silent! call HardMode()

" == ale ==
let g:ale_linters = {
\  'python':        ['flake8'],
\}
let g:ale_python_flake8_executable = "flake8_py27.bat"
"E501 - line too long (82 characters)
"E265 - Fix spacing after comment hash for block comments.
"W503 - Line break occurred before a binary operator
let g:ale_python_flake8_options = "--ignore=E501,E265,W503"

" dont lint while typing
let g:ale_lint_on_text_changed = 'never'

let g:ale_sign_error = '>'
let g:ale_sign_warning = '-'

let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] [%severity%]: %s '

let g:airline#extensions#ale#enabled = 1

" = remap =
"map <Leader>se :Errors<CR>
nmap <silent> <M-9> <Plug>(ale_previous_wrap)
nmap <silent> <M-0> <Plug>(ale_next_wrap)

let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1

" == autopep8 ==
let g:autopep8_max_line_length=120
"W690 - Fix various deprecated code (via lib2to3). No except as in python 2.5
"E309 - Add missing blank line (after class declaration)
let g:autopep8_ignore="W690,E309"

" == syntax-python ==
let python_highlight_all = 1

" == textobj_python ==
nnoremap <silent> ]c :call search('^\s*\zsclass ', 'W')<CR>
nnoremap <silent> [c :call search('^\s*\zsclass ', 'bW')<CR>
nnoremap <silent> ]f :call search('^\s*\zsdef ', 'W')<CR>
nnoremap <silent> [f :call search('^\s*\zsdef ', 'bW')<CR>
onoremap <silent> ]c :call search('^\s*\zsclass ', 'W')<CR>
onoremap <silent> [c :call search('^\s*\zsclass ', 'bW')<CR>
onoremap <silent> ]f :call search('^\s*\zsdef ', 'W')<CR>
onoremap <silent> [f :call search('^\s*\zsdef ', 'bW')<CR>

" == fullscreen ==
map <F11> <Esc>:call GuiWindowFullScreen(1)<CR>
map <S-F11> <Esc>:call GuiWindowFullScreen(0)<CR>
