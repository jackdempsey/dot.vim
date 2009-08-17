if v:lang =~ "utf8$" || v:lang =~ "UTF-8$"
   set fileencodings=utf-8,latin1
endif

set autoindent
set autowrite

set statusline=%n:%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P
" To emulate the standard status line with 'ruler' set, use this:
"
"   set statusline=%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P
"
" I've tweaked it a bit to show the buffer number on the left, and the total
" number of lines on the right.  Also, show the current Python function in the
" status line, if the pythonhelper.vim plugin exists and can be loaded.
"
" More detailed explanation:
"   %n          -- buffer number
"   %<%f        -- filename truncated from the beginning
"   %h          -- [help] if this is a help buffer
"   %m          -- [+] if modified
"   %r          -- [RO] if readonly
"   %1*         -- switch to highlight group User1
"   %{}         -- embed the output of a vim function
"   %*          -- switch to the normal highlighting
"
"   %=          -- right-align the rest
"
"   %-10.(...%) -- left-align the group inside %(...%)
"   %l          -- line number
"   %c          -- column
"   %V          -- virtual column, if different from %c (displayed as -{num})
"   %4L         -- right-aligned total number of lines in the buffer
"   %P          -- position in the file as percentage


au FileType * setl fo-=cro 

" Make ',e' (in normal mode) give a prompt for opening files
" in the same dir as the current buffer's file.
if has("unix")
  map ,e :e <C-R>=expand("%:p:h") . "/" <CR>
else
  map ,e :e <C-R>=expand("%:p:h") . "\\" <CR>
endif

" in the same dir as the current buffer's file.
if has("unix")
  map ,s :sp <C-R>=expand("%:p:h") . "/" <CR>
else
  map ,s :sp <C-R>=expand("%:p:h") . "\\" <CR>
endif

inoremap %/ <C-R>=expand("%:p:h")<CR>
nnoremap <F2> :set invpaste paste?<CR>
imap <F2> <C-O><F2>
set pastetoggle=<F2>

nmap <Tab> :bn<CR>
nmap <s-tab> :bp<CR>
map ,# :s/^/#/<CR>

set nocompatible        " Use Vim defaults (much better!)
set bs=2                " allow backspacing over everything in insert mode
"set ai                 " always set autoindenting on
"set backup             " keep a backup file
set viminfo='20,\"50    " read/write a .viminfo file, don't store more
                        " than 50 lines of registers
set history=512         " keep 512 lines of command line history
set ruler               " show the cursor position all the time

",v brings up my .vimrc
",V reloads it -- making all changes active (have to save first)

map ,v :sp /Users/jack/.vimrc<CR><C-W>_
map <silent> ,V :source /Users/jack/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>

" Ctrl-j/k deletes blank line below/above, and Alt-j/k inserts.
"nnoremap <silent><C-j> m`:silent +g/\m^\s*$/d<CR>``:noh<CR>
"nnoremap <silent><C-k> m`:silent -g/\m^\s*$/d<CR>``:noh<CR>
nnoremap <silent><C-j> :set paste<CR>m`o<Esc>``:set nopaste<CR>
nnoremap <silent><C-k> :set paste<CR>m`O<Esc>``:set nopaste<CR>

" Only do this part when compiled with support for autocommands
if has("autocmd")
  " In text files, always limit the width of text to 78 characters
	autocmd BufRead *.txt set tw=78
	" When editing a file, always jump to the last cursor position
	autocmd BufReadPost *
	\ if line("'\"") > 0 && line ("'\"") <= line("$") |
	\   exe "normal g'\"" |
	\ endif
endif
" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
	"set hlsearch
endif

if &term=="xterm"
	set t_Co=8
	set t_Sb=^[4%dm
	set t_Sf=^[3%dm
endif

"set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=1

set nocp
set ignorecase
set smartcase
"set redraw
set report=1
"set showmatch
set warn
"set window=43
"set wrapmargin=10
"set wrapscan
set ai
set tabstop=2
set expandtab
set softtabstop=2
set shiftwidth=2
set nowrap
set nohlsearch
set is
"version 4.0             " avoid warning for wrong version

if has("terminfo")
  set t_Co=8
  set t_Sf=[3%p1%dm
  set t_Sb=[4%p1%dm
else    
  set t_Co=8
  set t_Sf=[3%dm   
  set t_Sb=[4%dm
endif

if version >=500
  map gqp gqap
endif

syntax on

highlight type ctermfg=4
highlight statement ctermfg=4
highlight comment ctermfg=3
highlight string ctermfg=6
highlight number ctermfg=NONE
highlight function ctermfg=4
highlight identifier ctermfg=NONE
highlight todo ctermfg=4 ctermbg=NONE
highlight operator ctermfg=7 ctermbg=NONE
highlight preproc ctermfg=4
highlight error ctermfg=1 ctermbg=NONE
highlight errormsg ctermfg=1 ctermbg=NONE
highlight constant ctermfg=7
highlight Folded term=underline cterm=bold,underline ctermfg=7 ctermbg=0
highlight Foldcolumn term=underline cterm=bold,underline ctermfg=7 ctermbg=0

"au BufNewFile,BufRead *.m so $HOME/.vim/matlab.vim
"au BufNewFile,BufRead *.m4 so $HOME/.vim/matlab.vim
"au BufNewFile,BufRead *.tex so $HOME/.vim/tex.vim
au BufNewFile,BufRead *.c so $HOME/.vim/c.vim
au BufNewFile,BufRead *.cc so $HOME/.vim/cpp.vim
au BufNewFile,BufRead *.template so $HOME/.vim/cpp.vim
au BufNewFile,BufRead *.cpp so $HOME/.vim/cpp.vim
au BufNewFile,BufRead *.h so $HOME/.vim/cpp.vim
au BufNewFile,BufRead *.hh so $HOME/.vim/cpp.vim
au BufNewFile,BufRead *.js so $HOME/.vim/js.vim
au BufNewFile,BufRead *.htc so $HOME/.vim/js.vim
au BufNewFile,BufRead *.idl so $HOME/.vim/idl.vim
"au BufNewFile,BufRead *.rhtml so $HOME/.vim/eruby.vim
"au BufNewFile,BufRead *.erb so $HOME/.vim/eruby.vim
"au BufNewFile,BufRead *.html.erb so $HOME/.vim/eruby.vim
au BufNewFile,BufRead *.pt so $HOME/.vim/eruby.vim
au BufNewFile,BufRead *.zcml so $HOME/.vim/eruby.vim
au BufNewFile,BufRead *.rl so $HOME/.vim/ragel.vim
au BufNewFile,BufRead Makefile so $HOME/.vim/make.vim
" nginx
au BufNewFile,BufRead nginx.conf,nginx/conf.d/*.conf so $HOME/.vim/nginx.vim
"set viminfo='10,\"100,:20,%,nc:\\some\\place\\under\\Windoz\\_viminfo 
" the following restores the position in a previously edited file
set viminfo='10,\"100,:20,%,n~/.viminfo
    au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif 
"au BufNewFile,BufRead *.asm so $HOME/.simple/simple.vim

" When starting to edit a file:
"   For *.c and *.h files set formatting of comments and set C-indenting on
"   For other files switch it off
"   Don't change the sequence, it's important that the line with * comes first.
autocmd BufRead * set formatoptions=tcql nocindent comments&
autocmd BufRead *.c,*.h,*.cc,*.cpp,*.template set formatoptions=croql cindent comments=sr:/*,mb:*,el:*/,://
autocmd BufRead *.rb,*.rake,Rakefile set filetype=ruby
autocmd BufRead *.manifest set filetype=javascript

" Enable editing of gzipped files
"    read: set binary mode before reading the file
"          uncompress text in buffer after reading
"   write: compress file after writing
"  append: uncompress file, append, compress file
autocmd BufReadPre,FileReadPre      *.gz set bin
autocmd BufReadPost,FileReadPost    *.gz '[,']!gunzip
autocmd BufReadPost,FileReadPost    *.gz set nobin

autocmd BufWritePost,FileWritePost  *.gz !mv <afile> <afile>:r
autocmd BufWritePost,FileWritePost  *.gz !gzip <afile>:r

autocmd FileAppendPre               *.gz !gunzip <afile>
autocmd FileAppendPre               *.gz !mv <afile>:r <afile>
autocmd FileAppendPost              *.gz !mv <afile> <afile>:r
autocmd FileAppendPost              *.gz !gzip <afile>:r

set shellcmdflag=-c
set shellquote=
set shellslash          " Use the forward slash for expansion.
set shellxquote="
set shell=/opt/local/bin/zsh " Use the zsh shell
"set shellpipe=2>&1| tee
"set shellredir=>%s 2>&1

map <C-n> :tabnew<cr>
map <C-m> :tabclose<cr>
map <C-l> :tabnext<cr>
map <C-h> :tabprevious<cr>
map <C-o> :tabonly<cr>
map gF :sp<CR>gf

set suffixesadd=.rb
set includeexpr+=substitute(v:fname,'s$','','g')
"" or you can add substitution pattern s/ies$/y/g, s/ves$/f/g like this:
"" set includeexpr+=substitute(substitute(substitute(v:fname,'s$','','g'),'ie$','y','g'),'ve$','f','g')
iab xch <c-r>=strftime("%Y-%m-%d")<cr>

let loaded_matchparen = 1
color desert

" spell checking
map <F6> <Esc>:setlocal spell spelllang=en_gb<CR>
map <F7> <Esc>:setlocal nospell<CR>
" ]s and [s to navigate
" z= shows suggestions zg adds word to dictionary, zug performs an undo to the dictionary addition
hi SpellBad term=reverse ctermfg=white ctermbg=darkred guifg=#ffffff guibg=#7f0000 gui=underline
hi SpellCap guifg=#ffffff guibg=#7f007f
hi SpellRare guifg=#ffffff guibg=#00007f gui=underline
hi SpellLocal term=reverse ctermfg=black ctermbg=darkgreen guifg=#ffffff guibg=#7f0000 gui=underline



filetype plugin indent on
let clj_highlight_builtins = 1
let clj_highlight_contrib = 1
let clj_paren_rainbow = 1

"let clj_want_gorilla = 1

"let vimclojure#NailgunClient = "/Users/jack/src/vimclojure-2.1.1/ng"



hi clear Folded
