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

let g:airline#extensions#wordcount#enabled = 0

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
