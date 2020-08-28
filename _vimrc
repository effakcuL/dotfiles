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

"Code Completion
"Cpp
"vim lsp
"Plug 'prabirshrestha/async.vim'
"Plug 'prabirshrestha/asyncomplete.vim'
"Plug 'prabirshrestha/asyncomplete-lsp.vim'
"Plug 'prabirshrestha/vim-lsp'
"Plug 'ajh17/vimcompletesme'
"Plug 'mattn/vim-lsp-settings'
"Plug 'Valloric/YouCompleteMe'
"Python
"Plug 'davidhalter/jedi-vim'
"Plug 'deoplete-plugins/deoplete-jedi'
"Plug 'dense-analysis/ale'
"let g:ale_completion_enabled=1
"let g:ale_set_balloons=1

"Plug 'autozimu/LanguageClient-neovim', {
"    \ 'branch': 'next',
"    \ 'do': 'bash install.sh',
"    \ }
"Color Scheme
Plug 'morhetz/gruvbox'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'jackguo380/vim-lsp-cxx-highlight'
"GDB
Plug 'vim-scripts/Conque-GDB'

"Clang-Format
Plug 'kana/vim-operator-user'
Plug 'rhysd/vim-clang-format'

"OrgMode
"Plug 'jceb/vim-orgmode'

Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-dispatch'

Plug 'tpope/vim-sensible'
Plug 'liuchengxu/vim-better-default'
Plug 'easymotion/vim-easymotion'
"Plug 'neoclide/coc.nvim', {'branch': 'release'}


"Zettelkasten
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
"let g:deoplete#enable_at_startup = 1
"let g:deoplete#auto_complete=0
"inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
"set deoplete-options-auto_complete=0
"call deoplete#custom#option('auto_complete',0)
" Track the engine.
"Plug 'SirVer/ultisnips'

" Snippets are separated from the engine. Add this if you want them:
"Plug 'honza/vim-snippets'
"Plug 'wellle/targets.vim'


" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
"let g:UltiSnipsExpandTrigger="<c-e>"
"let g:UltiSnipsJumpForwardTrigger="<c-b>"
"let g:UltiSnipsJumpBackwardTrigger="<c-z>"
"let g:UltiSnipsSnippetDirectories=["~/.vim/plugged/vim-snippets/UltiSnips/,~/.vim/plugged/ultisnips/"]


" If you want :UltiSnipsEdit to split your window.
"let g:UltiSnipsEditSplit="vertical"

set path+="/home/falcon/Nextcloud/Zettelkasten/"
set suffixesadd+=.md

set runtimepath+=~/.vim/plugged/ultisnips

"OrgMode config
:let g:org_agenda_files=['~/Nextcloud/org/*.org']

"Calendar
"Plug 'mattn/calendar-vim'

"Switch Header<->Source
Plug 'ericcurtin/CurtineIncSw.vim'

"Adapt QuickFix
"Plug 'yssl/QFEnter'

call plug#end()

"let g:ConqueTerm_CloseOnEnd = 1    " close conque when program ends running

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

"let g:LanguageClient_useVirtualText = 'No'
"let g:ycm_server_python_interpreter='/usr/bin/python3'

map <F2> :Dispatch /home/falcon/Code/samuBuild/tests/AssistanceVisitor_Test_Run<CR> 
map <F3> :cclose<CR>
map <F4> :vsplit %<CR>
" mapping for switching between header and source
map <F5> :vsplit %<CR> :call CurtineIncSw()<CR>
map <F6> :ClangFormat<CR> 
map <F7> :hi! link Comment Ignore<CR>
map <F8> :hi! link Comment Comment<CR>

set makeprg=make\ -j8\ \--no-print-directory\ -C\ /home/falcon/Code/samuBuild
"set iskeyword+=:

"Make shift K look for std::<word under cursor> if regular man does not find
"anything... needs stdman installed
set keywordprg=${HOME}/.vim/manHelper.sh
set clipboard=unnamedplus
set mouse=a

set background=dark
colorscheme gruvbox
let g:gruvbox_contrast_dark = 'hard'

autocmd BufEnter *.cpp :setlocal cindent cino=j1,(0,ws,Ws

let mapleader=" "
let maplocalleader=","
:nnoremap <localleader>b :!hg annotate -udq %<CR>
:nnoremap <leader>d :!hg diff %<CR>
:nnoremap <leader>u :vs #<CR>
:nnoremap <leader>m :wa<CR> :Make<CR>
:nnoremap <leader>i gg=G<C-O><C-O>
":nnoremap <space> za

" Search and replace the word under the cursor
noremap <leader>ss :%s/\<<C-r><C-w>\>/

"let g:qfenter_keymap = {}
"let g:qfenter_keymap.open = ['<Leader><CR>', '<2-LeftMouse>']
"let g:qfenter_keymap.vopen = ['<CR>']
"let g:qfenter_keymap.hopen = ['<Leader><Space>']
"let g:qfenter_keymap.topen = ['<Leader><Tab>']
"if executable('clangd')
"    augroup lsp_clangd
"        autocmd!
"        autocmd User lsp_setup call lsp#register_server({
"                    \ 'name': 'clangd',
"                    \ 'cmd': {server_info->['clangd']},
"                    \ 'whitelist': ['h','c', 'cpp', 'objc', 'objcpp'],
"                    \ })
"        autocmd FileType h setlocal omnifunc=lsp#complete
"        autocmd FileType c setlocal omnifunc=lsp#complete
"        autocmd FileType cpp setlocal omnifunc=lsp#complete
"        autocmd FileType objc setlocal omnifunc=lsp#complete
"        autocmd FileType objcpp setlocal omnifunc=lsp#complete
"    augroup end
"endif
"let g:LanguageClient_serverCommands = {
"  \ 'cpp': ['clangd'],
"  \ }

"nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
"nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
"nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>
" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()
nmap <leader>rn <Plug>(coc-rename)
nnoremap <silent> K :call <SID>show_documentation()<CR>
"set keywordprg=:call\ <SID>show_documentation()
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()
autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
