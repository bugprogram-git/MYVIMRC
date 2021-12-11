"baseconfig---------------------------------------------------------------
let mapleader=" "
set number	
set wrap	
set cursorline	
set showcmd	
set ruler	
set tabstop=4	
set shiftwidth=4
set wildmenu
set hlsearch
set incsearch
set smartcase
set encoding=utf-8
set fileencoding=utf-8
set showmatch
set smartindent
set ignorecase
set hidden
set updatetime=100
set shortmess+=c
set signcolumn=number
syntax enable	
filetype on
filetype plugin on
filetype indent on
filetype plugin indent on
nnoremap tt :NERDTree<CR>
nnoremap ge <C-o>
inoremap <silent><expr> <c-o> coc#refresh()
nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel
nnoremap <leader>' viw<esc>a'<esc>hbi'<esc>lel
nnoremap <leader>< viw<esc>a><esc>hbi<<esc>lel
map <silent><LEADER>l :set splitright<CR>:vsplit<CR>
map <silent><LEADER>H :set nosplitright<CR>:vsplit<CR>
map <silent><LEADER>k :set nosplitbelow<CR>:split<CR>
map <silent><LEADER>j :set splitbelow<CR>:split<CR>
map <silent><LEADER>wh <C-w>h
map <LEADER>wl <C-w>l
map <LEADER>wj <C-w>j
map <LEADER>wk <C-w>k
tnoremap <LEADER>e <C-\><C-N>
nnoremap <silent>H :vertical resize-5<CR>
nnoremap <silent>L :vertical resize+5<CR>
nnoremap cj <C-w>H
nnoremap cl <C-w>K
noremap <silent> <LEADER><CR> :nohlsearch<CR>
set foldmethod=syntax
set nofoldenable
nnoremap <silent><LEADER>e :tabe<CR>
nnoremap <silent><LEADER>a :-tabnext<CR>
nnoremap <silent><LEADER>d :+tabnext<CR>
nnoremap <C-j> 5j
nnoremap <C-k> 5k
nnoremap <C-h> 5h
nnoremap <C-l> 5l
map U <C-r>
"BaseConfig-------------------------------------------------------------------

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nnoremap <LEADER>f :Leaderf function<CR>
nnoremap <LEADER>F :Leaderf file<CR>
let g:ale_linters_explicit = 1
let g:ale_completion_delay = 500
let g:ale_echo_delay = 20
let g:ale_lint_delay = 500
"let g:ale_echo_msg_format = '[%linter%] %code: %%s'
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
let g:airline#extensions#ale#enabled = 1
let g:ale_sign_error = "\ue009\ue009"
let g:lightline = {
\ 'colorscheme': 'snazzy',
\ }
let g:python3_host_prog = "/usr/bin/python3"
autocmd BufWrite * :Autoformat
let g:autoformat_autoindent = 0
let g:autoformat_retab = 0
let g:autoformat_remove_trailing_spaces = 0
hi! clear SpellBad
hi! clear SpellCap
hi! clear SpellRare
hi! SpellBad gui=undercurl guisp=red
hi! SpellCap gui=undercurl guisp=blue
hi! SpellRare gui=undercurl guisp=magenta
let g:ale_c_gcc_options = '-Wall -O2 -std=c99'
let g:ale_cpp_gcc_options = '-Wall -O2 -std=c++14'
let g:ale_c_cppcheck_options = ''
let g:ale_cpp_cppcheck_options = ''

"NERDTree
let NERDTreeWinPos="left"
let NERDTreeShowHidden=1
let NERDTreeWinSize=20
let NERDTreeAutoDeleteBuffer=1
"NERDTree
" Use tab for trigger completion with characters ahead and navigate.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

nnoremap <silent> <LEADER>h :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

"file_title
set completeopt=menu,menuone

"Plug vim-gutentags---------------------------------------------------------
let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']
let g:gutentags_ctags_tagfile = '.tags'
let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']
if !isdirectory(s:vim_tags)
   silent! call mkdir(s:vim_tags, 'p')
endif
"vim-gutentags-----------------------------------------------------------------
"config for vim-translator-------------------------------------------------
let g:translator_default_engines = ['youdao','bing']
let g:translator_window_type = 'popup'
nmap <silent> tr <Plug>TranslateW
vmap <silent> <LEADER>tr <Plug>TranslateV
"config for
"vim-translator-------------------------------------------------------------------------
"Plug 'skywind3000/asyncrun.vim'
"let g:asyncrun_open = 6
"nnoremap <F3> :call asyncrun#quickfix_toggle(6)<cr>
"nnoremap <silent> <F6> :AsyncRun -cwd=<root> make <cr>
"nnoremap <silent> <F7> :AsyncRun -cwd=<root> -raw make run <cr>
"let g:asyncrun_rootmarks = ['.svn', '.git', '.root', '_darcs', 'build.xml'] 
let g:coc_global_extensions = ['coc-json','coc-java','coc-vimlsp','coc-pyright']
let g:Lf_WindowPosition = 'left'
let g:Lf_PreviewInPopup = 1
autocmd BufNewFile *.sh,*.py exec ":call AutoSetFileHead()"
function! AutoSetFileHead()
	if &filetype == 'sh'
		call setline(1,"\#/usr/bin/bash")
	endif
	if &filetype == 'py'
		call setline(1,"\#/usr/bin/python3")
	endif
endfunc
call plug#begin('~/.config/nvim/plugged')
Plug 'connorholyday/vim-snazzy'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'preservim/nerdtree',{ 'on':  'NERDTreeToggle' }
Plug 'preservim/nerdcommenter'
Plug 'neoclide/coc.nvim'
Plug 'vim-autoformat/vim-autoformat'
Plug 'ludovicchabant/vim-gutentags'
Plug 'mhinz/vim-signify'
Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }
Plug 'alvan/vim-closetag'
Plug 'tpope/vim-fugitive'
Plug 'jiangmiao/auto-pairs'
Plug 'dense-analysis/ale'
Plug 'Yggdroot/indentLine'
"Plug 'puremourning/vimspector',{'do': './install_gadget.py --enable-python --enable-c --enable-java'}
Plug 'nathanaelkane/vim-indent-guides'
Plug 'voldikss/vim-translator'
call plug#end()
color snazzy
