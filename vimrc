set clipboard=unnamed
set nocompatible              " be iMproved, required
filetype off                  " required
nnoremap <Tab> :bn<CR>
nnoremap <S-Tab> :bN<CR>


" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
"
"
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'sjl/badwolf'

" All of your Plugins must be added before the following line
"
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


"" Vim-PLug core
"*****************************************************************************

"Letting paste without :set paste
let &t_SI .= "\<Esc>[?2004h"
let &t_EI .= "\<Esc>[?2004l"

inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()

function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction



let vimplug_exists=expand('~/.vim/autoload/plug.vim')

let g:vim_bootstrap_langs = "javascript,php,html,ruby,go"
let g:vim_bootstrap_editor = "vim"              " nvim or vim

if !filereadable(vimplug_exists)
if !executable("curl")
echoerr "You have to install curl or first install vim-plug yourself!"
execute "q!"
endif
echo "Installing Vim-Plug..."
echo ""
silent !\curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
let g:not_finish_vimplug = "yes"

autocmd VimEnter * PlugInstall
endif

"Required:
call plug#begin(expand('~/.vim/plugged'))

"*****************************************************************************
"" Plug install packages
"*****************************************************************************
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
Plug 'vim-scripts/grep.vim'
Plug 'vim-scripts/CSApprox'
Plug 'bronson/vim-trailing-whitespace'
Plug 'Raimondi/delimitMate'
Plug 'majutsushi/tagbar'
Plug 'Yggdroot/indentLine'
Plug 'avelino/vim-bootstrap-updater'
Plug 'sheerun/vim-polyglot'
Plug 'tmux-plugins/vim-tmux'
Plug 'janko/vim-test'
Plug 'dense-analysis/ale'

"Language Server Protocol (LSP) support for vim and neovim.
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

" (Optional) Multi-entry selection UI.
Plug 'junegunn/fzf'

if isdirectory('/usr/local/opt/fzf')
Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
else
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
" Use deoplete.
let g:deoplete#enable_at_startup = 1
set completeopt+=noinsert
autocmd FileType go call deoplete#custom#option('auto_complete', v:false)

endif
let g:make = 'gmake'
if exists('make')
    let g:make = 'make'
endif
Plug 'Shougo/vimproc.vim', {'do': g:make}

"" Vim-Session
Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'

if v:version >= 703
Plug 'Shougo/vimshell.vim'
endif

if v:version >= 704
"" Snippets
Plug 'SirVer/ultisnips'
endif

Plug 'honza/vim-snippets'

"" Color
" Plug 'tomasr/molokai'

""*****************************************************************************
""" Custom bundles
""*****************************************************************************

" html
"" HTML Bundle
Plug 'hail2u/vim-css3-syntax'
Plug 'gorodinskiy/vim-coloresque'
Plug 'tpope/vim-haml'
Plug 'mattn/emmet-vim'


" javascript
"" Javascript Bundle
Plug 'jelera/vim-javascript-syntax'


" php
"" PHP Bundle
Plug 'arnaud-lb/vim-php-namespace'


" ruby
Plug 'tpope/vim-rails'
Plug 'tpope/vim-rake'
Plug 'tpope/vim-projectionist'
Plug 'thoughtbot/vim-rspec'
Plug 'ecomba/vim-ruby-refactoring'


 Plug 'phpactor/phpactor', {'for': 'php', 'do': 'composer install'}
 " Plug 'roxma/LanguageServer-php-neovim',  {'do': 'composer install && composer run-script parse-stub'} // too slow to use
"*****************************************************************************
"*****************************************************************************

"" Include user's extra bundle
if filereadable(expand("~/.vimrc.local.bundles"))
source ~/.vimrc.local.bundles
endif

call plug#end()


" Required:
filetype plugin indent on
"*****************************************************************************"
"" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set bomb
set binary
set ttyfast

"" Fix backspace indent
set backspace=indent,eol,start

"" Tabs. May be overridden by autocmd rules
set tabstop=4
set softtabstop=0
set shiftwidth=4
set expandtab

"" Map leader to ,
let mapleader=','

"" Enable hidden buffers
set hidden

"" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

"" Directories for swp files
set nobackup
set noswapfile

set fileformats=unix,dos,mac

if exists('$SHELL')
set shell=$SHELL
else
set shell=/bin/sh
endif

" session management
let g:session_directory = "~/.vim/session"
let g:session_autoload = "no"
let g:session_autosave = "no"
let g:session_command_aliases = 1

"*****************************************************************************
"" Visual Settings
"*****************************************************************************
syntax on
set ruler
set number
set number relativenumber
set number relativenumber

nnoremap <leader>f :FZF<CR>

set mousemodel=popup
set t_Co=256
set guioptions=egmrti
set gfn=Monospace\ 10

if has("gui_running")
if has("gui_mac") || has("gui_macvim")
set guifont=Menlo:h12
set transparency=7
endif
else
let g:CSApprox_loaded = 1

" IndentLine
let g:indentLine_enabled = 1
let g:indentLine_concealcursor = 0
	let g:indentLine_char = 'b'
let g:indentLine_faster = 1

if $COLORTERM == 'gnome-terminal'
set term=gnome-256color
else
if $TERM == 'xterm'
  set term=xterm-256color
endif
endif

endif


if &term =~ '256color'
set t_ut=
endif


" Disable the blinking cursor.
set gcr=a:blinkon0
set scrolloff=3

" Status bar
set laststatus=2

""" Use modeline overrides
"set modeline
"set modelines=10

"set title
"set titleold="Terminal"
"set titlestring=%F

"set statusline=%F%m%r%h%w%=(%{&ff}/%Y)\ (line\ %l\/%L,\ col\ %c)\

"" Search mappings: These will make it so that going to the next one in a
"" search will center on the line it's found in.
"nnoremap n nzzzv
"nnoremap N Nzzzv

"if exists("*fugitive#statusline")
"set statusline+=%{fugitive#statusline()}
"endif

"*****************************************************************************
""  Airline
"*****************************************************************************
  let g:airline_theme = 'badwolf'
  let g:airline#extensions#tabline#enabled = 1
  let g:airline#extensions#syntastic#enabled = 1
  let g:airline#extensions#branch#enabled = 1
  let g:airline#extensions#tabline#left_sep = ' '
  let g:airline#extensions#tabline#left_alt_sep = '|'
  let g:airline#extensions#tabline#formatter = 'default'
  let g:airline#extensions#tagbar#enabled = 1
  let g:airline_skip_empty_sections = 1
  let g:airline#extensions#tabline#show_tabs = 0
  let g:airline#extensions#tabline#show_close_button = 0
  let g:airline#extensions#tabline#show_tab_type = 0

  if !exists('g:airline_symbols')
    let g:airline_symbols = {}
  endif

  " unicode symbols
  let g:airline_left_sep = '»'
  let g:airline_left_sep = '▶'
  let g:airline_right_sep = '«'
  let g:airline_right_sep = '◀'
  let g:airline_symbols.crypt = '🔒'
  let g:airline_symbols.linenr = '☰'
  let g:airline_symbols.linenr = '␊'
  let g:airline_symbols.linenr = '␤'
  let g:airline_symbols.linenr = '¶'
  let g:airline_symbols.maxlinenr = ''
  let g:airline_symbols.maxlinenr = '㏑'
  let g:airline_symbols.branch = '⎇'
  let g:airline_symbols.paste = 'ρ'
  let g:airline_symbols.paste = 'Þ'
  let g:airline_symbols.paste = '∥'
  let g:airline_symbols.spell = 'Ꞩ'
  let g:airline_symbols.notexists = 'Ɇ'
  let g:airline_symbols.whitespace = 'Ξ'

  " powerline symbols
  let g:airline_left_sep = ''
  let g:airline_left_alt_sep = ''
  let g:airline_right_sep = ''
  let g:airline_right_alt_sep = ''
  let g:airline_symbols.branch = ''
  let g:airline_symbols.readonly = ''
  let g:airline_symbols.linenr = '☰'
  let g:airline_symbols.maxlinenr = ''
  let g:airline_symbols.dirty='⚡'

  " old vim-powerline symbols
  let g:airline_left_sep = '⮀'
  let g:airline_left_alt_sep = '⮁'
  let g:airline_right_sep = '⮂'
  let g:airline_right_alt_sep = '⮃'
  let g:airline_symbols.branch = '⭠'
  let g:airline_symbols.readonly = '⭤'
  let g:airline_symbols.dirty='⚡'

  let g:airline_powerline_fonts = 1 

"*****************************************************************************
"" Abbreviations
"*****************************************************************************
"" no one is really happy until you have this shortcuts
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall

" enable line numbers
let NERDTreeShowLineNumbers=1
" make sure relative line numbers are used
autocmd FileType nerdtree setlocal relativenumber

" nerdtree show hidden files
let NERDTreeShowHidden=1

"" NERDTree configuration
let g:NERDTreeChDirMode=2
" let g:NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__']
let g:NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
let g:NERDTreeShowBookmarks=1
let g:nerdtree_tabs_focus_on_files=1
let g:NERDTreeMapOpenInTabSilent = '<RightMouse>'
let g:NERDTreeWinSize = 50
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite
nnoremap <silent> <F2> :NERDTreeFind<CR>
nnoremap <silent> <F3> :NERDTreeToggle<CR>

" grep.vim
nnoremap <silent> <leader>f :Rgrep<CR>
let Grep_Default_Options = '-IR'
let Grep_Skip_Files = '*.log *.db'
let Grep_Skip_Dirs = '.git node_modules'

" vimshell.vim
let g:vimshell_user_prompt = 'fnamemodify(getcwd(), ":~")'
let g:vimshell_prompt =  '$ '

" " terminal emulation
" if g:vim_bootstrap_editor == 'nvim'
" nnoremap <silent> <leader>sh :terminal<CR>
" else
" nnoremap <silent> <leader>sh :VimShellCreate<CR>
" endif


" In ~/.vim/vimrc, or somewhere similar.
 let g:ale_fixers = {
 \   '*': ['remove_trailing_lines', 'trim_whitespace'],
 \   'javascript': ['eslint', 'importjs', 'prettier', 'prettier_eslint', 'prettier_standard', 'standard', 'xo'],
 \   'GO': ['gofmt', 'go build'],
 \}
 " In ~/.vim/vimrc, or somewhere similar.
 let g:ale_linters = {
 \   'javascript': ['eslint'],
 \ 'go': ['gopls'],
 \}

" let g:ale_linters = {'go': ['gometalinter', 'gofmt']}

" Error and warning signs.
let g:ale_sign_error = '⤫'
let g:ale_sign_warning = '⚠'
" Enable integration with airline.
let g:airline#extensions#ale#enabled = 1

"*****************************************************************************
"" Functions
"*****************************************************************************
if !exists('*s:setupWrapping')
function s:setupWrapping()
set wrap
set wm=2
set textwidth=79
endfunction
endif

"*****************************************************************************
"" Autocmd Rules
"*****************************************************************************
"" The PC is fast enough, do syntax highlight syncing from start unless 200 lines
augroup vimrc-sync-fromstart
autocmd!
autocmd BufEnter * :syntax sync maxlines=200
augroup END

"" Remember cursor position
augroup vimrc-remember-cursor-position
autocmd!
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END

"" txt
augroup vimrc-wrapping
autocmd!
autocmd BufRead,BufNewFile *.txt call s:setupWrapping()
augroup END

"" make/cmake
augroup vimrc-make-cmake
autocmd!
autocmd FileType make setlocal noexpandtab
autocmd BufNewFile,BufRead CMakeLists.txt setlocal filetype=cmake
augroup END

set autoread

"*****************************************************************************
"" Mappings
"*****************************************************************************

"" Split
noremap <Leader>h :<C-u>split<CR>
noremap <Leader>v :<C-u>vsplit<CR>

"" Git
noremap <Leader>ga :Gwrite<CR>
noremap <Leader>gc :Gcommit<CR>
noremap <Leader>gca :Gcommit --am<CR>
noremap <Leader>gsh :Gpush<CR>
noremap <Leader>gshf :Gpush -f<CR>
noremap <Leader>gll :Gpull<CR>
noremap <Leader>gs :Gstatus<CR>
noremap <Leader>gb :Gblame<CR>
noremap <Leader>gd :Gvdiff<CR>
noremap <Leader>gr :Gremove<CR>

" session management
nnoremap <leader>so :OpenSession<Space>
nnoremap <leader>ss :SaveSession<Space>
nnoremap <leader>sd :DeleteSession<CR>
nnoremap <leader>sc :CloseSession<CR>

"" Tabs
" nnoremap <Tab> gt
" nnoremap <S-Tab> gT
nnoremap <silent> <S-t> :tabnew<CR>

"" Set working directory
nnoremap <leader>. :lcd %:p:h<CR>

"" Opens an edit command with the path of the currently edited file filled in
" noremap <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

"" Opens a tab edit command with the path of the currently edited file filled
" noremap <Leader>te :tabe <C-R>=expand("%:p:h") . "/" <CR>

"" fzf.vim
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.pyc,__pycache__
let $FZF_DEFAULT_COMMAND =  "find * -path '*/\.*' -prune -o -path 'node_modules/**' -prune -o -path 'target/**' -prune -o -path 'dist/**' -prune -o  -type f -print -o -type l -print 2> /dev/null"

" The Silver Searcher
if executable('ag')
  let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g ""'
  set grepprg=ag\ --nogroup\ --nocolor
endif

" ripgrep
if executable('rg')
  let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow --glob "!.git/*"'
  set grepprg=rg\ --vimgrep
  command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)
endif

cnoremap <C-P> <C-R>=expand("%:p:h") . "/" <CR>
" nnoremap <silent> <leader>b :Buffers<CR>
" nnoremap <silent> <leader>e :FZF -m<CR>

" snippets
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"
let g:UltiSnipsEditSplit="vertical"
" Tagbar
nmap <silent> <F4> :TagbarToggle<CR>
let g:tagbar_autofocus = 1

" Disable visualbell
set noerrorbells visualbell t_vb=
if has('autocmd')
  autocmd GUIEnter * set visualbell t_vb=
endif

"" Copy/Paste/Cut
if has('unnamedplus')
  set clipboard=unnamed,unnamedplus
endif

noremap YY "+y<CR>
noremap <leader>p "+gP<CR>
noremap XX "+x<CR>

if has('macunix')
  " pbcopy for OSX copy/paste
  vmap <C-x> :!pbcopy<CR>
  vmap <C-c> :w !pbcopy<CR><CR>
endif

"" Buffer nav
" noremap <leader>z :bp<CR>
" noremap <leader>q :bp<CR>
" noremap <leader>x :bn<CR>
" noremap <leader>w :bn<CR>

"" Close buffer

if has('vim_starting')
set nocompatible               " Be iMproved
endif

let t:NERDTreeBufName = get(t:, '', "default")

" close buffer and nerdtree if it is open
noremap <expr> <leader>c (bufwinnr(t:NERDTreeBufName) == 1 && bufname("") != "NERD_tree_1" && bufname("") != "NERD_tree_2"  ? ":NERDTreeClose\| bd!<CR>" : ":bd!<CR>" )
noremap <leader>c if bufwinnr("NERD_tree_2") == 1 && !bufname("") == "NERD_tree_2" :bp\| bd!#<CR> elseif :bd!<CR> endif
noremap <leader>c :bd!<CR>

"" Clean search (highlight)
nnoremap <silent> <leader><space> :noh<cr>

"" Switching windows
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h

"" Vmap for maintain Visual Mode after shifting > and <
vmap < <gv
vmap > >gv

"" Move visual block
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

"" Open current line on GitHub
nnoremap <Leader>o :.Gbrowse<CR>

"*****************************************************************************
"" Custom configs
"*****************************************************************************

" html
" for html files, 2 spaces
autocmd Filetype html setlocal ts=2 sw=2 expandtab


" javascript
let g:javascript_enable_domhtmlcss = 1

" vim-javascript
augroup vimrc-javascript
  autocmd!
  autocmd FileType javascript set tabstop=4|set shiftwidth=4|set expandtab softtabstop=4
augroup END


" php


"*****************************************************************************
"*****************************************************************************

"" Include user's local vim config
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif

"*****************************************************************************
"" Convenience variables
"*****************************************************************************
  " fzf
set rtp+=~/.fzf

" try FZF vs. ctrlp
nnoremap <leader>f :FZF<CR>


" Taken from Luan's since its the Pivotal standard
" https://github.com/luan/vimfiles/blob/master/config/plugin/NERDTree.vim
" ---------------
" NERDTree
" ---------------
nnoremap <leader>nn :NERDTreeToggle<CR>
nnoremap \ :NERDTreeToggle<CR>
nnoremap <leader>nf :NERDTreeFind<CR>
nnoremap \| :NERDTreeFind<CR>
let g:NERDTreeShowBookmarks=1
let g:NERDTreeChDirMode=2 " Change the NERDTree directory to the root node
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" set autochdir


inoremap <C-space> <C-x><C-o>
inoremap <C-@> <C-space>


"
" Prompt for a command to run
map <Leader>vp :VimuxPromptCommand<CR>
" get rid of arrwo key
inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>
cnoremap <C-h> <Left>
cnoremap <C-j> <Down>
" PHP stuff
"
"phpactor
" Include use statement

let g:phpactorPhpBin = 'php'
let g:phpactorBranch = 'master'
let g:phpactorOmniAutoClassImport = v:true
"Omni-completion
autocmd FileType php setlocal omnifunc=phpactor#Complete
let g:phpactorOmniError = v:true

autocmd FileType php nmap <Leader>u :call phpactor#UseAdd()<CR>

" Invoke the context menu
autocmd FileType php nmap <Leader>mm :call phpactor#ContextMenu()<CR>

" Invoke the navigation menu
autocmd FileType php nmap <Leader>nn :call phpactor#Navigate()<CR>

" Goto definition of class or class member under the cursor
autocmd FileType php nnoremap gd :call phpactor#GotoDefinition()<CR>

autocmd FileType php nnoremap gf :call phpactor#FindReferences()<CR>

" Transform the classes in the current file
autocmd FileType php nmap <Leader>tt :call phpactor#Transform()<CR>

" Generate a new class (replacing the current file)
autocmd FileType php nmap <Leader>cc :call phpactor#ClassNew()<CR>

" Extract expression (normal mode)
autocmd FileType php nmap <silent><Leader>ee :call phpactor#ExtractExpression(v:false)<CR>

" Extract expression from selection
autocmd FileType php vmap <silent><Leader>ee :<C-U>call phpactor#ExtractExpression(v:true)<CR>

" Extract method from selection
autocmd FileType php vmap <silent><Leader>em :<C-U>call phpactor#ExtractMethod()<CR>

autocmd FileType php nmap <Leader>i :call phpactor#Hover() <CR>

"*********************
"

nnoremap <leader>fx :call PHPCSFixer()<CR>

" Running test for PHP and Golang
nnoremap <leader>t :TestNearest<CR>
" nmap <silent> t<C-f> :TestFile<CR>
" nmap <silent> t<C-s> :TestSuite<CR>
" nmap <silent> t<C-l> :TestLast<CR>
" nmap <silent> t<C-g> :TestVisit<CR>

