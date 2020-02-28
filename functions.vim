" == diff ==
set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif

  let eq = ''
  let cmd = 'diff'
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction


" == open large file ==
let g:LargeFileLimit = 1024 * 1024 * 50 " 50 MB

" Protect large files from sourcing and other overhead. Set read only
if !exists("my_auto_commands_loaded")
  let my_auto_commands_loaded = 1
  " noswapfile (save copy of file)
  " bufhidden=unload (save memory when other file is viewed)
  " buftype=nowritefile (is read-only)
  " undolevels=-1 (no undo possible)
  augroup LargeFile
    " dont need eventignore+=FileType cuz we set syntax sync minlines, maxlines
    autocmd BufReadPre * let f=expand("<afile>") | if getfsize(f) > g:LargeFileLimit | setlocal noswapfile bufhidden=unload undolevels=-1 | endif
  augroup END
endif

" == CursorLineNr color refresh ==
function Interpolate(p, fro, to)
    return a:fro + a:p * (a:to - a:fro)
endfunction

" CursorLineNr is global. Issue to make it local: https://github.com/neovim/neovim/pull/6597

function UpdateCursorLineNrColor()
    let endLNr = line('$')
    if endLNr == 1
        let endLNr = 2
    endif
    let colors = [
                    \ [33, 196, 0],
                    \ [235, 235, 54],
                    \ [230, 28, 28]]
    let fg_colors = ['white', 'black', 'white']

    let p = (line('.') - 1) * 1.0 / (endLNr - 1)

    let fg_color_index = float2nr(p * len(fg_colors) - 0.001)
    let fg_color = fg_colors[fg_color_index]

    let color_index_from = float2nr(p * (len(colors) - 1) - 0.001)
    let color_index_to = color_index_from + 1
    let p2 = (p * (len(colors) - 1 )) - color_index_from

    let color_from = colors[color_index_from]
    let color_to = colors[color_index_to]

    let r = float2nr( Interpolate(p2, color_from[0], color_to[0]) )
    let g = float2nr( Interpolate(p2, color_from[1], color_to[1]) )
    let b = float2nr( Interpolate(p2, color_from[2], color_to[2]) )

    let c = printf('%02x%02x%02x', r, g, b)
    exe('hi CursorLineNr guibg=#'.c.' guifg='.fg_color)
endfunction

autocmd CursorMoved * call UpdateCursorLineNrColor()
hi CursorLineNr term=bold gui=bold guifg=black
