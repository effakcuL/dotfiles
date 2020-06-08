filetype plugin indent on

"Replace tabs with 4 spaces
set tabstop=4
set shiftwidth=4
set expandtab

"Allow Folding according to syntax
set foldmethod=syntax
set foldlevelstart=20
set hlsearch


"Install Plugins
call plug#begin()

"Install fuzzy search for files in current folder( :Files ) or c++ Tags like
"Methods or symbols ( :Tags )
Plug 'junegunn/fzf', { 'dir': '~/.bin/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

"Install Tag generation
"Needs sudo apt install global
Plug 'ludovicchabant/vim-gutentags'
Plug 'skywind3000/gutentags_plus'
Plug 'skywind3000/asyncrun.vim'

"Code Completion
"Cpp
Plug 'Valloric/YouCompleteMe'
"Python
Plug 'davidhalter/jedi-vim'
Plug 'deoplete-plugins/deoplete-jedi'

"Color Scheme
Plug 'morhetz/gruvbox'

"GDB
Plug 'vim-scripts/Conque-GDB'

"Clang-Format
Plug 'kana/vim-operator-user'
Plug 'rhysd/vim-clang-format'

"OrgMode
Plug 'jceb/vim-orgmode'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-dispatch'

Plug 'tpope/vim-sensible'

"Zettelkasten
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
let g:deoplete#enable_at_startup = 1
let g:deoplete#auto_complete=0
"set deoplete-options-auto_complete=0
"call deoplete#custom#option('auto_complete',0)
" Track the engine.
Plug 'SirVer/ultisnips'

" Snippets are separated from the engine. Add this if you want them:
Plug 'honza/vim-snippets'


" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-e>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsSnippetDirectories=["~/.vim/plugged/vim-snippets/UltiSnips/,~/.vim/plugged/ultisnips/"]


" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

set path+="/home/falcon/Nextcloud/Zettelkasten/"
set suffixesadd+=.md

set runtimepath+=~/.vim/plugged/ultisnips

"OrgMode config
:let g:org_agenda_files=['~/Nextcloud/org/*.org']

"Calendar
Plug 'mattn/calendar-vim'

"Switch Header<->Source
Plug 'ericcurtin/CurtineIncSw.vim'

"Adapt QuickFix
Plug 'yssl/QFEnter'

call plug#end()

let g:ConqueTerm_CloseOnEnd = 1    " close conque when program ends running

let g:clang_format#detect_style_file = 1
"let g:clang_format#auto_format = 1

"Configure gutentags
let g:gutentags_modules = ['ctags', 'gtags_cscope']
" config project root markers.
let g:gutentags_project_root = ['.root']
" generate datebases in my cache directory, prevent gtags files polluting my project
let g:gutentags_cache_dir = expand('~/.cache/tags')
" change focus to quickfix window after search (optional).
let g:gutentags_plus_switch = 1
let g:gutentags_define_advanced_commands = 1

let g:ycm_server_python_interpreter='/usr/bin/python3'

" mapping for switching between header and source
map <F5> :vsplit %<CR> :call CurtineIncSw()<CR>
map <F6> :ClangFormat<CR> 

set makeprg=make\ -j8\ \--no-print-directory\ -C\ /home/falcon/Code/samuBuild
"set iskeyword+=:

"Make shift K look for std::<word under cursor> if regular man does not find
"anything... needs stdman installed
set keywordprg=${HOME}/.vim/manHelper.sh
set clipboard=unnamedplus

set background=dark
colorscheme gruvbox
let g:gruvbox_contrast_dark = 'hard'

autocmd BufEnter *.cpp :setlocal cindent cino=j1,(0,ws,Ws

let mapleader=" "
let maplocalleader=","
:nnoremap <localleader>b :!hg annotate -udq %<CR>
:nnoremap <leader>d :!hg diff %<CR>
:nnoremap <leader>u :vs #<CR>
":nnoremap <leader>m :wa<CR> :make<CR>  :!cvlc /home/falcon/.vim/JobsDone.m4a vlc://quit<CR>
:nnoremap <leader>m :wa<CR> :Make<CR>
:nnoremap <leader>i gg=G<C-O><C-O>
":nnoremap <space> za

" Search and replace the word under the cursor
noremap <leader>ss :%s/\<<C-r><C-w>\>/

let g:qfenter_keymap = {}
let g:qfenter_keymap.open = ['<Leader><CR>', '<2-LeftMouse>']
let g:qfenter_keymap.vopen = ['<CR>']
let g:qfenter_keymap.hopen = ['<Leader><Space>']
let g:qfenter_keymap.topen = ['<Leader><Tab>']

