""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General settings.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets how many lines of history VIM has to remember
set history=1000

" Enable filetype plugins
filetype plugin on
filetype plugin indent on

" Set to auto read when a file is changed from the outside
set autoread

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" Be smart when using tabs
" Auto indents based on indentation level.
set smarttab

set incsearch

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Turn on the WiLd menu
set wildmenu
set wildmode=list:longest,full

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=.git\*,.hg\*,.svn\*
else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store,*/*.pyc,*/.*o
endif

"Always show current position
set ruler

" Height of the command bar
set cmdheight=2

" A buffer becomes hidden when it is abandoned
set hid

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Add a bit extra margin to the left
set foldcolumn=1

set nocompatible              " be iMproved, required
filetype off                  " required

" Make VIM remember position in file after reopen
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
:set nu
autocmd StdinReadPre * let s:std_in=1

" File specific tabbing scheme
autocmd Filetype c,h setlocal ts=8 sw=4 cindent
autocmd Filetype cpp,hpp,cxx setlocal ts=2 sw=4 expandtab
autocmd Filetype python setlocal ts=4 sw=4 noexpandtab
autocmd Filetype go,html,javascript setlocal ts=2 sw=2 expandtab
autocmd Filetype ruby setlocal ts=2 sw=2 expandtab

" Set column guide to 80 + 1 for the bar itself.
if exists('+colorcolumn')
  set colorcolumn=81
else
    au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>81v.\+', -1)
endif

autocmd BufWritePre * %s/\s\+$//e

" Highlight lines longer than 80chars
match ErrorMsg '\%>80v.\+'

" Enable syntax highlighting
syntax enable

try
    colorscheme seattle
catch
endtry

set background=dark

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type.
set ffs=unix,dos,mac

" Backups
set backupdir^=~/.backup
set dir^=~/.backup//

" Specify the behavior when switching between buffers.
try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry

" Return to last edit position when opening files.
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Always show the status line.
set laststatus=2

" On Mac, XCode manages clang lib.
if has("win32")
  let g:clang_library_path="/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/"
elseif has("unix")
  let g:clang_library_path="/usr/lib/"
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Helper functions
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Type !<exec> to launch shell commands
" eg: !pwd
function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
   let l:currentBufNum = bufnr("%")
   let l:alternateBufNum = bufnr("#")

   if buflisted(l:alternateBufNum)
     buffer #
   else
     bnext
   endif

   if bufnr("%") == l:currentBufNum
     new
   endif

   if buflisted(l:currentBufNum)
     execute("bdelete! ".l:currentBufNum)
   endif
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Lightline (https://github.com/itchyny/lightline.vim)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:lightline = {
    \ 'colorscheme': 'wombat',
    \ 'active': {
    \   'left': [ ['mode', 'paste'],
    \             ['gitbranch', 'fugitive', 'readonly', 'filename', 'modified'] ],
    \   'right': [ [ 'lineinfo'  ], ['percent']  ]
    \ },
    \ 'component': {
    \   'readonly': '%{&filetype=="help"?"":&readonly?"🔒":""}',
    \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
    \   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}'
    \ },
    \ 'component_visible_condition': {
    \   'readonly': '(&filetype!="help"&& &readonly)',
    \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
    \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
    \ },
        \ 'separator': { 'left': ' ', 'right': ' '  },
    \ 'subseparator': { 'left': ' ', 'right': ' '  }
    \ }

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Indent Guide (https://github.com/nathanaelkane/vim-indent-guides)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:indent_guides_auto_colors = 0

hi IndentGuidesEven ctermbg=black
hi IndentGuidesOdd ctermbg=darkgrey

autocmd VimEnter * IndentGuidesEnable

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" OmniCppCompletion plugin
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable OmniCompletion
" http://vim.wikia.com/wiki/Omni_completion
filetype plugin on
set omnifunc=syntaxcomplete#Complete

" Configure menu behavior
" http://vim.wikia.com/wiki/VimTip1386
set completeopt=longest,menuone
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
\ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
inoremap <expr> <M-,> pumvisible() ? '<C-n>' :
  \ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

" Use Ctrl+Space for omni-completion
" http://stackoverflow.com/questions/510503/ctrlspace-for-omni-and-keyword-completion-in-vim
inoremap <expr> <C-Space> pumvisible() \|\| &omnifunc == '' ?
	\ "\<lt>C-n>" :
	\ "\<lt>C-x>\<lt>C-o><c-r>=pumvisible() ?" .
	\ "\"\\<lt>c-n>\\<lt>c-p>\\<lt>c-n>\" :" .
	\ "\" \\<lt>bs>\\<lt>C-n>\"\<CR>"
imap <C-@> <C-Space>

" Popup menu hightLight Group
highlight Pmenu ctermbg=13 guibg=LightGray
highlight PmenuSel ctermbg=7 guibg=DarkBlue guifg=White
highlight PmenuSbar ctermbg=7 guibg=DarkGray
highlight PmenuThumb guibg=Black

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" YCM settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ycm_global_ycm_extra_conf ='~/.vim/.ycm_extra_config.py'
let g:ycm_semantic_triggers =  {
  \   'c' : ['->', '.'],
  \   'objc' : ['->', '.'],
  \   'cpp,objcpp' : ['->', '.', '::'],
  \   'perl' : ['->'],
  \   'php' : ['->', '::'],
  \   'cs,java,javascript,d,vim,ruby,python,perl6,scala,vb,elixir,go' : ['.'],
  \   'lua' : ['.', ':'],
  \   'erlang' : [':'],
  \ }

let g:ycm_complete_in_comments_and_strings=1
let g:ycm_key_list_select_completion=['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion=['<C-p>', '<Up>']
let g:ycm_autoclose_preview_window_after_completion = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ctrl-P
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.(git|hg|svn)|\_site)$',
  \ 'file': '\v\.(exe|so|dll|class|png|jpg|jpeg)$',
\}

" Use the nearest .git|.svn|.hg|.bzr directory as the cwd
let g:ctrlp_working_path_mode = 'r'

" enter file search mode
nmap <leader>p :CtrlP<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Key Remapping
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Fast saving
nmap <leader>w :w!<cr>

" Smart way to move between windows
" Move left
map <C-h> <C-W>h
" Move Down
map <C-j> <C-W>j
" Move left
map <C-k> <C-W>k
" Move right
map <C-l> <C-W>l

" Close the current buffer
map <leader>bd :Bclose<cr>:tabclose<cr>gT

" Close all the buffers
map <leader>ba :bufdo bd<cr>

map <leader>l :bnext<cr>
map <leader>h :bprevious<cr>

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove
map <leader>t<leader> :tabnext

" Let 'tl' toggle between this and the last accessed tab
let g:lasttab = 1
nmap <Leader>tl :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" Remap VIM 0 to first non-blank character
map 0 ^

" Move a line of text using ALT+[jk] or Command+[jk] on mac
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

if has("mac") || has("macunix")
  nmap <D-j> <M-j>
  nmap <D-k> <M-k>
  vmap <D-j> <M-j>
  vmap <D-k> <M-k>
endif

map <C-n> :NERDTreeToggle<CR>

" Copies current file path to system clipboard
" Mac version.
" For example, if you set your leader as ','
" pressing ,cf would copy the path of the opened buffer to your clipboard
" which you can copy paste into other programs.
if has("mac") || has("gui_macvim") || has("gui_mac")
  " relative path  (src/foo.txt)
  nnoremap <leader>cf :let @*=expand("%")<CR>

  " absolute path  (/something/src/foo.txt)
  nnoremap <leader>cF :let @*=expand("%:p")<CR>

  " filename       (foo.txt)
  nnoremap <leader>ct :let @*=expand("%:t")<CR>

  " directory name (/something/src)
  nnoremap <leader>ch :let @*=expand("%:p:h")<CR>
endif

if has("gui_gtk") || has("gui_gtk2") || has("gui_gnome") || has("unix")
  " relative path (src/foo.txt)
  nnoremap <leader>cf :let @+=expand("%")<CR>

  " absolute path (/something/src/foo.txt)
  nnoremap <leader>cF :let @+=expand("%:p")<CR>

  " filename (foo.txt)
  nnoremap <leader>ct :let @+=expand("%:t")<CR>

  " directory name (/something/src)
  nnoremap <leader>ch :let @+=expand("%:p:h")<CR>
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" set the runtime path to include Vundle and initialize
call plug#begin('~/.vim/plugged')
" " alternatively, pass a path where Vundle should install plugins
" "call vundle#begin('~/some/path/here')
"
" " let Vundle manage Vundle, required

" Automatic ctags cleanup on file writes. This plugin searches parent
" directories for any .tags files and removes stale tags.
Plug 'craigemery/vim-autotag'

" Syntax checking
Plug 'scrooloose/syntastic'

" Convenient completion for XML/HTML
Plug 'othree/xml.vim'

" Press t to toggle tagbar.
Plug 'majutsushi/tagbar'

" gc to toggle comments
Plug 'tomtom/tcomment_vim'

" Browse the file system
Plug 'scrooloose/nerdtree'

" Fuzzy search
Plug 'kien/ctrlp.vim'

" Git plugin
Plug 'tpope/vim-fugitive'

" Snippets are separated from the engine. Add this if you want them:
Plug 'honza/vim-snippets'

" Skeltons for common filetypes
Plug 'noahfrederick/vim-skeleton'

" PEP8 indentation for python
Plug 'hynek/vim-python-pep8-indent'

" Better handling of (), [], etc
Plug 'jiangmiao/auto-pairs'

" Move function arguments around easily.
Plug 'AndrewRadev/sideways.vim'

" Lighter alternative to airline
Plug 'itchyny/lightline.vim'

" Indentation guide
Plug 'nathanaelkane/vim-indent-guides'

" YCM
Plug 'Valloric/YouCompleteMe'

" Ctrlp
Plug 'kien/ctrlp.vim'

" All of your Plugins must be added before the following line
call plug#end()
