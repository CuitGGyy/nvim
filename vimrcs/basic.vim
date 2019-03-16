""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Maintainer: 
"       Jonet Lai <joney.lai@gmail.com>
"
" Sections:
"    -> General settings
"    -> VIM user interface
"    -> Colors and Fonts
"    -> Files and backups
"    -> Text, tab and indent related
"    -> Visual mode related
"    -> Moving around, tabs and buffers
"    -> Status line and curosr line
"    -> Editing mappings
"    -> Spell checking
"    -> GUI related
"    -> Misc
"    -> Helper functions
"    -> Turn persistent undo on 
"       means that you can undo even when you close a buffer/VIM
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use VIM advanced settings
set nocompatible

" Sets how many lines of history VIM has to remember
set history=500

" Enable filetype plugins
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = "\\"
let g:mapleader = "\\"

" Fast saving
nmap <leader>w :w!<cr>

" :W sudo saves the file 
" (useful for handling the permission-denied error)
command W w !sudo tee % > /dev/null


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Avoid garbled characters in Chinese language windows OS
let $LANG='en' 
set langmenu=en
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

" Turn on the Wild menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc,*.exe
if has("win16") || has("win32")
    set wildignore+=.git\*,.hg\*,.svn\*,.bzr\*
else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.bzr/*,*/.DS_Store
endif

" Enable automatic change directory
set showmode

" Enable automatic change directory
set autochdir

" Self-explanatory
set splitright

" Interoperate with the X clipboard
set clipboard=unnamed

" Browse buffer directory
set browsedir=buffer

"Always show line number
set number

"Always show current position
set ruler

" Height of the command bar
set cmdheight=1

" A buffer becomes hidden when it is abandoned
set hidden

" Configure backspace so it acts as it should act
"set backspace=eol,start,indent
"set whichwrap+=<,>,h,l
set backspace=indent,eol,start
set whichwrap+=b,s,h,l,<,>,[,]

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases 
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch 

" Don't redraw while executing macros (good performance config)
set lazyredraw 

" Smoother changes
set ttyfast

" Set update time 1s
set updatetime=1000

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

" Properly disable sound on errors on MacVim
if has("gui_macvim")
    autocmd GUIEnter * set vb t_vb=
endif

" Add a bit extra margin to the left
set foldcolumn=1

" Keep cursor column when moving
set nostartofline

" Set 5 lines to the cursor - when moving vertically using j/k
set scrolloff=5

" Always show cursor line
set cursorline

" When mouse click which mode will be
set mouse=a


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable 

" Enable 256 colors palette in Gnome Terminal
if $COLORTERM == 'gnome-terminal'
    set t_Co=256
endif

" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=T
    set guioptions-=e
    set t_Co=256
    set t_ut=
    set guitablabel=%M\ %t
endif

try
    " Color scheme
    colorscheme molokai
    "let g:molokai_original = 1     " original malokai
    "let g:rehash256 = 1            " terminal 256 color
    let g:airline_theme='dark'
catch
    colorscheme desert

    " If colorscheme doesn't define cursor line color, just use fellow:
    "highlight CursorLine gui=underline guifg=NONE guibg=NONE term=underline cterm=underline ctermfg=NONE ctermbg=NONE
    highlight CursorLine term=underline cterm=underline ctermfg=NONE ctermbg=NONE

    " Change color when entering insert mode
    "autocmd InsertEnter * highlight CursorLine gui=bold guifg=NONE guibg=NONE term=bold cterm=bold ctermfg=NONE ctermbg=NONE
    autocmd InsertEnter * highlight CursorLine term=bold cterm=bold ctermfg=NONE ctermbg=NONE

    " Revert color to default when leaving insert mode
    "autocmd InsertLeave * highlight CursorLine gui=underline guifg=NONE guibg=NONE term=underline cterm=underline ctermfg=NONE ctermbg=NONE
    autocmd InsertLeave * highlight CursorLine term=underline cterm=underline ctermfg=NONE ctermbg=NONE
endtry


" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set fileformats=unix,dos,mac

" Double character for unicode
set ambiwidth=double

" Default file encoding
set fileencoding=utf-8

" File encoding squence, compatible Asian character encoding
set fileencodings=utf-8,cp936,gb18030,utf-16,ucs-bom,gbk,gb2312,big5,euc-jp,euc-kr,latin1

let &termencoding=&encoding
"let g:fencview_autodetect=1
"let g:fencview_auto_patterns='*'


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowritebackup
set noswapfile


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
"set smarttab

" No smart when using tabs ;)
set nosmarttab
set tabstop=8
" 1 tab == 4 spaces
set softtabstop=4
set shiftwidth=4

" Linebreak on 500 characters
set linebreak
set textwidth=500

" Auto indent
set autoindent

" Smart indent
"set smartindent

" No smart indent
set nosmartindent
set noshiftround
set nopaste

" Wrap lines
"set wrap "Wrap lines
" No wrap lines
set nowrap

" Turn on folding
set foldenable
" Dont't autofold anything (but I can still fold manually)
set foldlevel=100
" Dont't open folds when you search into them
set foldopen-=search
" Dont't open folds when you undo stuff
set foldopen-=undo


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :<C-u>call VisualSelection('', '')<cr>/<C-R>=@/<cr><cr>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<cr>?<C-R>=@/<cr><cr>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
map <C-w> <C-W>w

" Close the current buffer
map <leader>bc :bdelete<cr>:tabclose<cr>gT

" Close all the buffers
map <leader>bd :bufdo bd<cr>

" Switch buffers
map <leader>bn :bnext<cr>
map <leader>bp :bprevious<cr>
map <leader>bf :bfirst<cr>
map <leader>bl :blast<cr>

map <leader>bb :bnext<cr>
map <leader>b<leader> :bprevious<cr>

" Open each buffer in tab
map <leader>ts :tab sball<cr>

" Useful mappings for managing tabs
map <leader>tb :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tm :tabmove<space>
map <leader>tn :tabnext<space>
map <leader>tf :tabfirst<cr>
map <leader>tl :tablast<cr>

map <leader>tt :tabnext<cr>

" Let '<leader>t<leader>' toggle between this and the last accessed tab
let g:lasttab = 1
nmap <leader>t<leader> :exe "tabn ".g:lasttab<cr>
au TabLeave * let g:lasttab = tabpagenr()

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Specify the behavior when switching between buffers 
try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry

" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Status line and cursor line
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

" If no vim-airline, statusline format below with  ALE linter status can use instead.
"set statusline=\ [%{mode()}%H%M%R%W%{Paste()}]\ %<%F%=[%{&ff}]\ %p%%,\ %l/%L\ :\ %c\ %y\ %(%{LinterStatus()}\ %)

" If no vim-airline, use statusline format below as default.
set statusline=\ [%{mode()}%H%M%R%W%{Paste()}]\ %<%F%=[%{&ff}]\ %p%%,\ %l/%L\ :\ %c\ %y\ %(%)


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remap VIM 0 to first non-blank character
map 0 ^

" Move a line of text using ALT+[jk] or Command+[jk] on mac
"nmap <M-j> mz:m+<cr>`z
"nmap <M-k> mz:m-2<cr>`z
"vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
"vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

"if has("mac") || has("macunix")
  "nmap <D-j> <M-j>
  "nmap <D-k> <M-k>
  "vmap <D-j> <M-j>
  "vmap <D-k> <M-k>
"endif

" Delete trailing white space on save, useful for some filetypes ;)
function! CleanExtraSpaces()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfunction

if has("autocmd")
    autocmd BufWritePre *.txt,*.js,*.py,*.wiki,*.sh,*.coffee :call CleanExtraSpaces()
endif


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pressing <leader><leader>s will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>
"map <leader>ss :setlocal spell!<cr>

" Shortcuts using <leader>
"map <leader>sn ]s
"map <leader>sp [s
"map <leader>sa zg
"map <leader>s? z=


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => GUI related
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("gui_running")
    " Toggle vim gui menu bar
    map <S-F10> :if &go=~#'m'<BAR>set go-=m<BAR>set go-=T<BAR>set go-=r<BAR>else<BAR>set go+=m<BAR>set go+=T<BAR>set go+=r<BAR>endif<CR>

    " Colorscheme
    try
        " vscode style
        colorscheme codedark
        "let g:codedark_conservative = 1
        let g:airline_theme='codedark'

        " solarized dark
        "colorscheme solarized
        "set background=dark
        "let g:solarized_termcolors=256
        "let g:solarized_termtrans=1
        "let g:solarized_visibility="normal"
    catch
        colorscheme torte
    endtry
endif

" Set font according to system
if has("mac") || has("macunix")
    set gfn=Monaco:h18,IBM\ Plex\ Mono:h14,Hack:h14,Source\ Code\ Pro:h15,Menlo:h15
elseif has("win16") || has("win32")
    set gfn=IBM\ Plex\ Mono:h14,Source\ Code\ Pro:h12,Bitstream\ Vera\ Sans\ Mono:h11
elseif has("gui_gtk2")
    set gfn=IBM\ Plex\ Mono:h14,:Hack\ 14,Source\ Code\ Pro\ 12,Bitstream\ Vera\ Sans\ Mono\ 11
elseif has("linux")
    set gfn=IBM\ Plex\ Mono:h14,:Hack\ 14,Source\ Code\ Pro\ 12,Bitstream\ Vera\ Sans\ Mono\ 11
elseif has("unix")
    set gfn=Monospace\ 11
endif

" Disable scrollbars (real hackers don't use scrollbars for navigation!)
set guioptions-=r
set guioptions-=R
set guioptions-=l
set guioptions-=L


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Misc
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remove the Windows ^M - when the encodings gets messed up
noremap <leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Quickly open a buffer for scribble
"map <leader>q :e ~/buffer<cr>

" Quickly open a markdown buffer for scribble
"map <leader>x :e ~/buffer.md<cr>

" Toggle paste mode on and off
nmap <leader><leader>p :setlocal paste!<cr>

" Disable highlight when <leader><space> is pressed
nmap <silent> <leader><space> :nohl<cr>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Returns string if paste mode is enabled
function! Paste()
    if &paste
        return ',PASTE'
    endif
    return ''
endfunction

" Returns string if ale has errors or warnings
function! LinterStatus() abort
    let l:counts = ale#statusline#Count(bufnr(''))

    let l:all_errors = l:counts.error + l:counts.style_error
    let l:all_non_errors = l:counts.total - l:all_errors

    "return l:counts.total == 0 ? 'OK' : printf(
    return l:counts.total == 0 ? '' : printf(
    \   '%dW %dE',
    \   all_non_errors,
    \   all_errors
    \)
endfunction

function! CmdLine(str)
    call feedkeys(":" . a:str)
endfunction 

" If last window is not editable, quit vim.
autocmd BufEnter * if 0 == len(filter(range(1, winnr('$')), 'empty(getbufvar(winbufnr(v:val), "&bt"))')) | qa! | endif


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Turn persistent undo on 
"    means that you can undo even when you close a buffer/VIM
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
try
    set undodir=~/.vim/undodir
    set undofile
catch
endtry

