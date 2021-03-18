let s:fontsize_normal = 11
let s:fontsize_big = 16

"Guifont! Consolas:h11
:execute "GuiFont! Consolas:h" . s:fontsize_normal

" Disable the gui autocomplete pop-up and use the build in
GuiPopupmenu 0

" Expand to fullscreen on neovim open
"au GUIEnter * simalt ~x

" hide the gui tab line
GuiTabline 0

" Maximize the GUI on startup
call GuiWindowMaximized(1)

" Make the GUI fullscreen on startup
"call GuiWindowFullScreen(1)
"

" ===============================================
" Increase/Descrease Font Size
" ===============================================
let s:fontsize = s:fontsize_normal

function! AdjustFontSize(amount)
  let s:fontsize = s:fontsize+a:amount
  :execute "GuiFont! Consolas:h" . s:fontsize
endfunction

function! BigFontSize()
  let s:fontsize = s:fontsize_big
  :execute "GuiFont! Consolas:h" . s:fontsize
endfunction

function! NormalFontSize()
  let s:fontsize = s:fontsize_normal
  :execute "GuiFont! Consolas:h" . s:fontsize
endfunction

noremap <kPlus> :call AdjustFontSize(1)<CR>
noremap <kMinus> :call AdjustFontSize(-1)<CR>
noremap <C-kPlus> :call BigFontSize()<CR>
noremap <C-kMinus> :call NormalFontSize()<CR>