set nocompatible " must be first

let xml_use_xhtml = 1 " xml.vim

" based on http://www.vi-improved.org/vimrc.php
set t_Co=256
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" general
""""""""""""""""""""""""""""""""""""""""""""""""""""""""

source ~/.vim/php-doc.vim
inoremap <C-u> <Esc> :call PhpDocSingle()<CR>i
nnoremap <C-u> :call PhpDocSingle()<CR>i
vnoremap <C-u> :call PhpDocRange()<CR>i

filetype on " detect the filetype
set backspace=indent,eol,start
filetype plugin indent on
set history=150          " keep command line history
set showcmd             " display incomplete commands
set hidden              " allow multiple buffers without saving

set viminfo='10,\"100,:20,%,n~/.vim/.viminfo
"au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif " continue where we left
"position merken
"au BufReadPost * if line("'\"") | exe "'\"" | endif
"set viminfo='10,\"30,:20,%,n~/.viminfo

""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Theme/colors
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set background=dark
syntax on


""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" files/backups
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set backup
set backupdir=~/.vim/backup
set directory=~/.vim/temp " tmpfiles
"set makeef=error.err " When using make, where should it dump the file

set grepprg=grep\ -nH\ --exclude='.*.swp'\ --exclude='*~'\ --exclude='*.svn-base'\ $*

""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VIM UI
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"set lsp=0 " space it out a bit
set wildmenu " command line completion in statusbar for commands
set ruler " always show current position at bottom
set cmdheight=2
set number " linenumbers
"set lz " do not redraw when running macros (much faster)
set backspace=4 "make backspace work normal
"set whichwrap+=<,>,h,l  " backspace and cursor keys wrap to
"set mouse=a " enable mouse for everything.
"set shortmess=atI " shortens messages to avoid 'press a key' prompt
"set report=0 " tell us when anything is changed via :...
set expandtab " autoexpand tabs to spaces.. ugh

autocmd InsertLeave * se nocul " Highlight current line in insert mode.
autocmd InsertEnter * se cul


""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Visual Cues
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set showmatch " show matching brackets
set mat=5 " how many tenths for a sec to blink matches
set hlsearch
set incsearch
set ignorecase
set so=1 "keep x lines top/bottom for scope
set novisualbell " don't blink
set noerrorbells " and don't scream
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
set laststatus=2 " always show the status line


""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Text formatting/layout
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"set fo=tcrqn " See Help (complex)
set ai " autoindent
set si " smart indent
set cindent " c-style
set tabstop=4
set shiftwidth=4
set softtabstop=4
set wrap " do wrap lines

""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Folding
" Enable folding, but by default make it act like folding is off, because
" folding is annoying in anything but a few rare cases
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set foldenable
"set foldmethod=indent
set foldlevel=100 " don't autofold anything (but let me do it if I want to)
"set foldopen-=search " don't open folds when you search into them
"set foldopen-=undo " don't open folds when you undo stuff


""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" File explorer
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:explVertical=1 " should I split vertically
let g:explWinSize=35 " width of 35 pixels

""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CTags
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let Tlist_Sort_Type = "name" " order by
let Tlist_Use_Right_Window = 1 " split to the right side of the screen
"let Tlist_Compart_Format = 1 " show small menu
"let Tlist_Exist_OnlyWindow = 1 " if you are the last, kill yourself


""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Matchit
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let b:match_ignorecase = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Custom Functions
""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Minibuf plugin
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""

map <A-i> i <ESC>r " alt-i (normal mode) inserts a single char, and then switches back to normal
:nmap ø :
:let mapleader = "æ"
:let maplocalleader = "æ"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" tab navigation
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" I don't really use these..
"	nmap = insert, map = all, nmap = normal

" tabnew
":nmap <C-t> :tabnew<cr>
":imap <C-t> <ESC>:tabnew<cr>

:nmap <C-Insert> :tabnew<CR>
:imap <C-Insert> <ESC>:tabnew<CR>

" tabnext
":nmap <C-tab> :tabnext<cr>
":map <C-tab> :tabnext<cr>
":imap <C-tab> <ESC>:tabnext<cr>

:nmap <a-right> :tabnext<cr>
:imap <a-right> <ESC>:tabnext<cr>

" tabprevious
":nmap <C-S-tab> :tabprevious<cr>
":imap <C-S-tab> <ESC>:tabprevious<cr>i
":map <C-S-tab> :tabprevious<cr>

:nmap <a-left> :tabprev<cr>
:imap <a-left> <ESC>:tabprev<cr>

" tabclose
:nmap <C-Delete> :tabclose<CR>
:imap <C-Delete> <ESC>:tabclose<CR>

" :nmap <C-w> :tabclose<cr>
" :imap <C-w> <ESC>:tabclose<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" misc mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" open file
":nmap <c-o> :VTreeExplore<cr>
":nmap <c-o> :NERDTreeToggle<cr>
:nmap <f9> :NERDTreeToggle<cr>

" switch to window left
:nmap <silent> <A-Up> :wincmd h<CR>
" switch to window right
:nmap <silent> <A-Down> :wincmd l<CR>

":map <F9>  :nohlsearch<CR>

" vtreeexplorer + taglist left side
":map <F12> <ESC>:Tlist<CR><C-s-W>h <C-s-W>s:VTreeExplore<CR>:set nonu<CR><C-s-W>l

" taglist
:map <f11> :TlistToggle<cr>

        "\ :!ctags -f %:p:h/tags
        "\ --tag-relative=yes --PHP-kinds=+cf-v %:p:h<CR>

set tags=./.tags,.tags

:map <f12> :q!<cr>

set pastetoggle=<f2>

if has("vms")
	  set nobackup          " do not keep a backup file, use versions instead
	else
	  set backup            " keep a backup file
endif


""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Autocommands
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd BufEnter * :syntax sync fromstart " ensure every file does syntax highlighting (full)
au BufNewFile,BufRead *.asp :set ft=aspjscript " all my .asp files ARE jscript
au BufNewFile,BufRead *.tpl :set ft=html " all my .tpl files ARE html
au BufNewFile,BufRead *.hta :set ft=html " all my .hta files ARE html

autocmd BufReadPost *.log,/var/log/* normal G


""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Useful abbrevs
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"iab xasp <%@language=jscript%><CR><%<CR><TAB><CR><BS>%><ESC><<O<TAB>
"iab xdate <c-r>=strftime("%d/%m/%y %H:%M:%S")<cr>
iab pf public function
iab dump parTools::dumpd(
iab bgc background-color: green;


""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Useful abbrevs
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd filetype css setlocal equalprg=csstidy\ -\ --silent=true

" Remove any trailing whitespace that is in the file
autocmd BufRead,BufWrite * if ! &bin | silent! %s/\s\+$//ge | endif
