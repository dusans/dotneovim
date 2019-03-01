" == ultisnip ==
let g:UltiSnipsUsePythonVersion = 2
let g:UltiSnipsJumpForwardTrigger = "<c-n>"
let g:UltiSnipsJumpBackwardTrigger = "<c-p>"
let g:UltiSnipsSnippetDirectories=["UltiSnips", "ultisnips_my"]

nnoremap <F7> :call LoadUltisnips()<cr>:call UltiSnips_ListSnippets()<CR>
inoremap <F7> <esc>:call LoadUltisnips()<cr>a<c-r>=UltiSnips_ExpandSnippet()<cr>

" == startify ==
map <Leader>s :Startify<CR>
let g:startify_custom_indices = ['a', 'd', 'f', 'l', 'w', 'o', 'm', 'h', '0', '1', '2', '3', '4', '5', '6', '7', '8', '9']
let g:startify_bookmarks = [ '$NEOVIM_MY/init.vim']
let g:startify_custom_header = [
                \'                          ____  ____  ____  ____  ____ ',
                \'                         ||V ||||I ||||M ||||8 ||||0 ||',
                \'                         ||__||||__||||__||||__||||__||',
                \'                         |/__\||/__\||/__\||/__\||/__\|',
                \ ]

let g:startify_files_number        = 8
let g:startify_enable_special      = 0

let g:startify_session_persistence = 1
let g:startify_session_autoload    = 1
let g:startify_session_dir = '$NEOVIM_MY/sessions'

map <F12> :SSave
map <S-F12> :SLoad

map <Leader>ss :mksession! $NEOVIM_MY/sessions/def.vim<CR>
map <F5> :SLoad def.vim<CR><Esc>:call GuiWindowFullScreen(1)<CR><CR>

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

" == ctags ==
" Execute CTags
map <Leader>ect :silent !ctags --recurse=yes --languages=python .<CR>
set tags=./tags;/
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

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
map <Leader>f :CtrlPFunky<CR>
let g:ctrlp_funky_syntax_highlight = 1
let g:ctrlp_funky_use_cache = 1

" == signature ==
highlight SignColumn guibg=black  " column background color
let g:SignaturePrioritizeMarks = 0
let g:SignaturePeriodicRefresh = 0  " slow

" == airline ==
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#tab_nr_type = 0 " # of splits (default)
let g:airline#extensions#tabline#tab_nr_type = 1 " tab number
" switch position of buffers and tabs on splited tabline (c)
let g:airline#extensions#tabline#switch_buffers_and_tabs = 1
" enable/disable displaying buffers with a single tab. (c)
let g:airline#extensions#tabline#show_buffers = 0
" enable/disable displaying open splits per tab (only when tabs are opened). >
let g:airline#extensions#tabline#show_splits = 0
 " buffers names with similar filename, suppressing common parts of paths.
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'

let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''

let g:airline_theme="powerlineish"

let g:airline_section_y = ''
let g:airline_section_z = ''


let g:airline_mode_map = {
     \ '__' : '-',
     \ 'n'  : 'NOR',
     \ 'i'  : 'INS',
     \ 'R'  : 'REP',
     \ 'c'  : 'C',
     \ 'v'  : 'VIS',
     \ 'V'  : 'VIS',
     \ '' : 'VIS',
     \ 's'  : 'S',
     \ 'S'  : 'S',
     \ '' : 'S',
     \ }

let g:airline_inactive_collapse=1
let g:airline#extensions#tagbar#enabled = 0

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
