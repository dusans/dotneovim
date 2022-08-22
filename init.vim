if has('win32')
    set runtimepath^=$VIM
    set runtimepath^=$VIMRUNTIME
    let &packpath = &runtimepath
endif

" ================ python ================
if has('win32')
    let g:python_host_prog = expand('$PY27_64_CONDA\python.exe')
    let g:python3_host_prog = expand('$PY3_CONDA\python.exe')
else
    let g:python_host_prog = '/usr/bin/python2'
    let g:python3_host_prog = '/usr/bin/python3'
endif

" ================ plugins_install ================
source $NEOVIM_MY/plugins_install.vim

" ================ main ================
filetype off

" ================ base ================
set laststatus=2 " Always display the statusline in all windows
syntax on
filetype plugin indent on
set encoding=utf-8
set autochdir

" == default, windows ==
if has('win32')
    source $VIMRUNTIME/mswin.vim
	behave mswin
endif

" == session ==
set sessionoptions+=resize,winpos
set sessionoptions+=tabpages,globals
set sessionoptions-=options

" == menu in command line ==
set wildmenu
set wildmode=list:longest,full

" == color ==
colorscheme wombat
set background=dark
hi Search guibg=Orange2

" search pattern: the first match gets highlighted.
" when typing the replacement field, the document is modified live.
set inccommand=nosplit

" current curson color
"hi CursorLine guibg=#1B1B1B
"hi CursorLine guibg=#121212
hi CursorLine guibg=#000000
augroup CursorLine
  au!
  au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  au WinLeave * setlocal nocursorline
augroup END

" diff
highlight DiffAdd cterm=none ctermfg=black ctermbg=Red gui=none guibg=#133209
highlight DiffDelete cterm=none ctermfg=black ctermbg=Red gui=none guibg=#4D1D14
highlight DiffChange cterm=none ctermfg=black ctermbg=Yellow gui=none guibg=#444444
highlight DiffText cterm=none ctermfg=black ctermbg=Magenta gui=none guibg=#000000
"guifg=white

" == font ==
"set lines=40 columns=150
" spacing between lines
set linespace=0

" width of sign column
set signcolumn=yes:1

" == width ==
set textwidth=79
if has('win32')
    set colorcolumn=81
endif
hi ColorColumn guibg=#292929
set formatoptions+=t

" == wrap ==
set breakindent
set showbreak=>>>>
" don't wrap lines by inserting a new line character at a predefined limit
set tw=0

" == gui menus ==
set guioptions-=T " remove toolbar
set guioptions-=m " remove menu
set guioptions-=r " remove right scrollbar
set guioptions-=L " remove left scrollbar
set guioptions-=b " remove bottom scrollbar

" == height ==
" the height of the command line
set cmdheight=1

" ==== fold ====
set foldmethod=indent
set foldnestmax=2
set foldcolumn=1
set foldlevel=0
set foldlevelstart=1
set foldminlines=2
set nofoldenable

" = fold-color =
hi Folded guibg=#292929 guifg=#818181
hi FoldColumn guibg=#292929 guifg=#818181

" = toggle fold =
map z<Space> za

" = tab settings =
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent

" == case search settings ==
set ignorecase
set smartcase
nmap // :nohlsearch<cr>

" == number ==
set numberwidth=3
set number
set relativenumber
setglobal relativenumber

" ================ remaps ================
let mapleader = ";"

" find next, previus
noremap <Space> ;
noremap <M-Space> ,

map <Leader>w *

" ==== window ====
" = resize =
if bufwinnr(1)
    map <Up> <C-W>+
    map <Down> <C-W>-
    map <Left> <C-W><
    map <Right> <C-W>>

    map <M-o> 16<C-W>+
endif

" = close/save =
map <M-w> :close<CR>
map <M-s> :update<CR>
map <C-s> :update<CR>

" = move between windows =
map <A-k> <C-w>k
map <A-j> <C-w>j
map <A-l> <C-w>l
map <A-h> <C-w>h

" https://technotales.wordpress.com/2010/04/29/vim-splits-a-guide-to-doing-exactly-what-you-want/
function! MoveBuf(direction)
    let bufno = bufnr("%")
    hide
    exec "wincmd " . a:direction
    new
    exec "buffer " . bufno
endfunction

" = move windows inside tab =
map <C-W><M-h> :call MoveBuf("h")<CR>
map <C-W><M-l> :call MoveBuf("l")<CR>
map <C-W><M-j> :call MoveBuf("j")<CR>
map <C-W><M-k> :call MoveBuf("k")<CR>

" ==== tab ====
" = move between tabs =
map  <C-h> :tabp<CR>
map  <C-l> :tabn<CR>
map  <M-n> :tabnew<CR>

" = move tabs in tabline =
map <M-Left> :tabm -1<CR>
map <M-Right> :tabm +1<CR>

" = go to tab by number =
"noremap <M-1> 1gt
"noremap <M-2> 2gt
"noremap <M-3> 3gt
"noremap <M-4> 4gt
"noremap <M-5> 5gt
"noremap <M-6> 6gt
"noremap <M-7> 7gt
"noremap <M-8> 8gt
"noremap <M-9> 9gt
"noremap <M-0> :tablast<cr>

" = go to last active tab =
au TabLeave * let g:lasttab = tabpagenr()
nnoremap <silent> <M-y> :exe "tabn ".g:lasttab<cr>
vnoremap <silent> <M-y> :exe "tabn ".g:lasttab<cr>

" == move ==
" move cursor position in insert mode
inoremap <A-o> <C-o>$
inoremap <A-h> <left>
inoremap <A-l> <right>
inoremap <A-j> <down>
inoremap <A-k> <up>

if has('win32')
    " mswin.vim remaps <C-y>.
    " I want the normal <C-y> that moves screen down one line
    unmap <C-y>
endif

" move to middle of current line
map gm :call cursor(0, len(getline('.'))/2)<CR>

" == execute ==
" Start Terminal
map <Leader>st :let @+ = "python " . expand("%:t")<CR><bar>:!start ConEmu64.exe /Single /cmd {cmd}<CR><CR>

" == diff ==
map <Leader>dt :windo diffthis<CR>
map <Leader>do :windo diffoff!<CR>

" == other ==
map <C-o> :let @+ = expand("%:p")<CR>

" == spell ==
"set spell spelllang=en
"set nospell

" ================ functions ================
source $NEOVIM_MY/functions.vim

" ================ complete ================
source $NEOVIM_MY/autocomplete.vim

" ================ plugins ================
source $NEOVIM_MY/plugins_conf.vim

" ================ override ===============
" setting that some plugins override

" Hide the default mode text (-- INSERT -- below the statusline)
set noshowmode

" == buffers update some features in update interval - increased to reduce lag ==
autocmd BufEnter * set updatetime=4000

" how many lines before/max current line to start syntax highlighting parsing
" autocmd Syntax * syn sync clear | syntax sync minlines=1024 | syntax sync maxlines=1024

" Center screen on next/previous selection.
nnoremap n nzz
nnoremap N Nzz
" Last and next jump should center too.
"nnoremap <C-o> <C-o>zz
"nnoremap <C-i> <C-i>zz

" ================ changed ===============
" https://github.com/neovim/neovim/issues/2127#issuecomment-150954047
augroup AutoSwap
        autocmd!
        autocmd SwapExists *  call AS_HandleSwapfile(expand('<afile>:p'), v:swapname)
augroup END

function! AS_HandleSwapfile (filename, swapname)
        " if swapfile is older than file itself, just get rid of it
        if getftime(v:swapname) < getftime(a:filename)
                call delete(v:swapname)
                let v:swapchoice = 'e'
        endif
endfunction
autocmd CursorHold,BufWritePost,BufReadPost,BufLeave *
  \ if isdirectory(expand("<amatch>:h")) | let &swapfile = &modified | endif

augroup checktime
    au!
    if !has("gui_running")
        "silent! necessary otherwise throws errors when using command
        "line window.
        autocmd BufEnter,CursorHold,CursorHoldI,CursorMoved,CursorMovedI,FocusGained,BufEnter,FocusLost,WinLeave * checktime
    endif
augroup END
