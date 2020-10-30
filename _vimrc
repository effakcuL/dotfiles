"Install Plugins
call plug#begin()

"" General Configuration
Plug 'liuchengxu/vim-better-default'
" Show possible commands
Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-dispatch'

Plug 'easymotion/vim-easymotion'

" ColorScheme
Plug 'morhetz/gruvbox'

Plug 'junegunn/fzf', { 'dir': '~/.bin/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'


"" VersionControl
Plug 'tpope/vim-fugitive'


"" Coding
" Language Server Protocol client
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'jackguo380/vim-lsp-cxx-highlight'

" Debugging
Plug 'puremourning/vimspector'

"Install Tag generation
"Needs sudo apt install global
Plug 'ludovicchabant/vim-gutentags'
Plug 'skywind3000/gutentags_plus'

"Clang-Format
Plug 'rhysd/vim-clang-format'

Plug 'wellle/targets.vim'

call plug#end()


"let g:vimspector_enable_mappings = 'HUMAN'
"packadd! vimspector
"let g:vimspector_base_dir='/home/falcon/.vim/plugged/vimspector'
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

map <F2> :Dispatch /home/falcon/Code/samuBuild/tests/AssistanceVisitor_Test_Run<CR>
map <F3> :cclose<CR>
map <F4> :vsplit %<CR>
" mapping for switching between header and source
map <F5> :vsplit <bar>CocCommand clangd.switchSourceHeader<CR>
map <F6> :ClangFormat<CR>
map <F7> :hi! link Comment Ignore<CR>
map <F8> :hi! link Comment Comment<CR>

set makeprg=make\ -j8\ \--no-print-directory\ -C\ /home/falcon/Code/samuBuild

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
cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!
" Search and replace the word under the cursor
noremap <leader>ss :%s/\<<C-r><C-w>\>/

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
nmap <silent> <leader>gd <Plug>(coc-definition)
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

nmap <leader>e :call vimspector#Launch()<CR>
nnoremap <silent> <leader> :WhichKey '<Space>'<CR>
set timeoutlen=500
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

