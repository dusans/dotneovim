call plug#begin('~/AppData/Local/nvim/plugged')

" start
Plug 'mhinz/vim-startify'

" status and tab line
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" visual: themes
Plug 'cschlueter/vim-wombat'

" visual: syntax
Plug 'jdevera/vim-stl-syntax'
Plug 'dzeban/vim-log-syntax'
Plug 'hdima/python-syntax'
Plug 'ingydotnet/yaml-vim'

" visual: help
Plug 'nathanaelkane/vim-indent-guides'
Plug 'gcavallanti/vim-noscrollbar'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'kshenoy/vim-signature'  " plugin to place, toggle and display marks.

" insert: base
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-surround'
Plug 'vim-scripts/YankRing.vim'

" insert: complete
Plug 'davidhalter/jedi-vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'deoplete-plugins/deoplete-jedi'
Plug 'hynek/vim-python-pep8-indent'

" insert: snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" navigate: text_object
Plug 'bps/vim-textobj-python'
Plug 'kana/vim-textobj-user'

" navigate: search
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tacahiroy/ctrlp-funky'
Plug 'inkarkat/vim-ingo-library'  " vim-mark depends on it
Plug 'inkarkat/vim-mark'
Plug 'justinmk/vim-sneak'

" version_control
Plug 'ludovicchabant/vim-lawrencium'  " disabled cuz of problem with airline

" code_check
Plug 'tell-k/vim-autopep8'
Plug 'w0rp/ale'

" special
Plug 'tpope/vim-repeat'
Plug 'dusans/vim-hardmode', { 'branch': 'hjkl-repeat' }

call plug#end()
