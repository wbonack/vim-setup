" We use a vim
set nocompatible

set clipboard=unnamed

" Set mapleader
let mapleader = ","
let g:mapleader = ","

" Colo(u)red or not colo(u)red
" If you want color you should set this to true
set hlsearch
let color = "true"

if has("syntax")
    if color == "true"
        autocmd BufEnter * :syntax sync fromstart
        " This will switch colors ON
        so ${VIMRUNTIME}/syntax/syntax.vim
    else
        " this switches colors OFF
        syntax off
        set t_Co=0
    endif
endif

" Syntax highlighting for template files as json
autocmd BufNewFile,BufRead *.template set ft=json

" display the match for a search pattern when halfway typing it
set incsearch

" create a command which toggles highlighted searches on/off
map <F5> :let &hlsearch=!&hlsearch<CR>

" turn on filetype detection
filetype plugin indent on

" display tab characters and end-of-line whitespace
" (unfortunately, the list option is mutually exlusive with
" the linebreak option; it's one or the other!)
set list
set listchars=tab:>-,trail:-

" highlight when braces and parens match
set showmatch
set matchtime=2 " default time of 5 tenths of a second too long

" allow backspace to delete characters before the cursor
" the 3 options tell vim to delete white space at start of the line,
" a line break, and the character before where Insert mode started
set backspace=indent,eol,start

" tell vim to repeat indent of previous line
set autoindent

" keep 200 commands and 200 search patterns in the history
set history=2000

" only keep 500 levels of undo
set undolevels=500

" always display the current cursor position in the lower right corner
set ruler

" display incomplete commands in the lower right corner as they are being typed
set showcmd

" map the Q key to the gq command
map Q gq

" a complicated keymapping:
" make "p" in visual mode overwrite the selected text with the previously
" yanked text
vnoremap p <Esc>:let current_reg = @"<CR>gvs<C-R>=current_reg<CR><Esc>

" set wordwrap on and don't allow words to break
set wrap

" set linebreak

" set tabs to be equivalent to 4 characters instead of 8 (the default)
set shiftwidth=2
set softtabstop=2
set tabstop=4
set expandtab

" always indent to multiples of the shiftwidth
set shiftround

" show partial last lines at bottom of screen
set display=lastline

" allow cursor keys to move from line to line when going from left to right,
" regardless of whether in or not in insert mode
set whichwrap=b,s,h,l,<,>,[,]

" autocommand: after a file is read, check if the '" mark is defined, and
" jump to it if so; backslashes are used to continue single command lines
" (can only be used in a vim script file, not on the vim command line)
autocmd BufReadPost *
            \ if line("'\"") > 0 && line("'\"") <= line ("$") |
            \   exe "normal g'\"" |
            \ endif

" allow buffer to be modified by filter commands
set modifiable

" easier access to buffers
set wildchar=<Tab> wildmenu wildmode=full
set wildcharm=<C-Z>
nnoremap <F10> :b <C-Z>

" create command shortcut "Zap" to zap.py script
com -nargs=* -range=% -bar Zap %!zap.py <args> -

" file format detection and interpretation!
set fileformats=unix,dos,mac

" force saves in particular file formats
com Wmac set fileformat=mac | write
com Wdos set fileformat=dos | write
com Wunix set fileformat=unix | write

" confirm operations that would erase unsaved buffer changes
set confirm

" set up default printing options
set printoptions=paper:letter,duplex:off,number:y

" set filebrowser
" the following setting limits tab completion to longest it can find based on
" what you've already typed in; sometimes useful, other times annoying; YMMV
"set wildmode=longest:full
set wildmenu

" use the visualbell instead of the beep on errors
set visualbell

" show line numbers
set number

" window resizing
nmap = :resize +1<CR>
nmap - :resize -1<CR>
nmap <C-l> :vertical resize +5<CR>
nmap <C-h> :vertical resize -5<CR>

" NERDTreeToggle
nmap <C-t> :NERDTreeToggle<CR>

" autocmd BufEnter * if &modifiable | NERDTreeFind | wincmd p | endif

" preserve buffer history when switching
set hidden

" automatically format (indent) xml, html
au FileType xml exe ":silent 1,$!xmllint --format --recover - 2>/dev/null"
au FileType html exe ":silent 1,$!xmllint --format --recover - 2>/dev/null"

" format (indent) json
nmap <C-j> :%!python -m json.tool<CR>
vmap <Leader>j :!python -m json.tool<CR>

" Add vim syntax highlighting
execute pathogen#infect()
syntax enable
filetype plugin indent on

colorscheme jellybeans

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" add ,f
map <leader>f :NERDTreeToggle<cr>
map <leader>r :NERDTreeFind<cr>

autocmd FileType ruby compiler ruby

let g:syntastic_javascript_checkers = ['closurecompiler']
let g:syntastic_javascript_closurecompiler_path = "/Users/wbonack/.rvm/gems/ruby-2.1.2/gems/closure-compiler-1.1.11/lib/closure-compiler-20140730.jar"

" let g:indentLine_color_term = 239

" Set up CtrlP
set runtimepath^=~/.vim/bundle/ctrlp.vim

filetype plugin indent on " Require

" Set up running specs shortcut
let g:rspec_command = 'call Send_to_Tmux("bundle exec rspec {spec}\n")'

" vim-rspec mappings
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

" Puts what you pasted into the buffer
xnoremap p pgvy

" Trying to fix vim swp file annoyingness
set backupdir=~/.vimbackupdir,~/tmp,~/,.
set directory=~/.vimbackupdir,~/tmp,~/,.

map <Leader>, :A<CR>

" Set git blame
map <Leader>gb :Gblame<CR>

" Set statusline to 2 for Josh's bottom bar
set laststatus=2
"python from powerline.vim import setup as powerline_setup
"python powerline_setup()
"python del powerline_setup

map <Leader>w :wincmd h<CR>
map <Leader>e :wincmd l<CR>

map <Leader>b :b

" Make an ack shortcut
map <Leader>ck :Ack

" Make the tab close shortcut
map <Leader>tc :tabclose<CR>

" Shortcut for quit
map <Leader>q :q<CR>

" Shortcut for tabonly
map <Leader>to :tabo<CR>

set noignorecase

" Allow clicking in vim to select things, etc
set mouse=a

" ~/.vimrc ends here
