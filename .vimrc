" Line numbers
set number

syntax on

" When coding, auto-indent by 4 spaces, just like in K&R
" Note that this does NOT change tab into 4 spaces
" You can do that with "set tabstop=4", which is a BAD idea
set shiftwidth=4

" Always replace tab with 8 spaces, except for makefiles
set expandtab
autocmd FileType make setlocal noexpandtab

" My settings when editing *.txt files
"   - automatically indent lines according to previous lines
"   - replace tab with 8 spaces
"   - when I hit tab key, move 2 spaces instead of 8
"   - wrap text if I go longer than 76 columns
"   - check spelling
autocmd FileType text setlocal autoindent expandtab softtabstop=2 textwidth=76 spell spelllang=en_us

" My setting for editing *.c files
autocmd FileType c setlocal autoindent tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab

" My setting for editing *.sh files
autocmd FileType sh setlocal autoindent tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab

autocmd FileType cpp setlocal autoindent tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab

" My setting for editing *.c files
autocmd FileType python setlocal autoindent tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab

" Don't do spell-checking on Vim help files
autocmd FileType help setlocal nospell

" Prepend ~/.backup to backupdir so that Vim will look for that directory
" before littering the current dir with backups.
" You need to do "mkdir ~/.backup" for this to work.
set backupdir^=~/.backup

" Also use ~/.backup for swap files. The trailing // tells Vim to incorporate
" full path into swap file names.
set dir^=~/.backup//

" Ignore case when searching
" - override this setting by tacking on \c or \C to your search term to make
"   your search always case-insensitive or case-sensitive, respectively.
set ignorecase

" Highlight lines longer than 80chars
match ErrorMsg '\%>80v.\+'
