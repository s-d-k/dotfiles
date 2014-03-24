" Setting up Vundle - the vim plugin bundler
let iCanHazVundle=1
let vundle_readme=expand('~/.vim/bundle/vundle/README.md')
if !filereadable(vundle_readme)
    echo "Installing Vundle.."
    echo ""
    silent !mkdir -p ~/.vim/bundle
    silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
    let iCanHazVundle=0
endif
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Plugin 'gmarik/vundle'

" Space as leader
let mapleader = "\<Space>"

""" Filetype detect and syntax highlighting on
filetype plugin indent on
syntax on

"""
""" Plugins
"""

""" system extensions
Plugin 'tpope/vim-eunuch' " basic unix utilities
Plugin 'tpope/vim-dispatch' " run shell commands in background
Plugin 'tpope/vim-vinegar' " netrw enhancements
Plugin 'benmills/vimux' " tmux integration
Plugin 'rking/ag.vim' " support for the_silver_seracher
Plugin 'christoomey/vim-tmux-navigator' " vim/tmux window integration

""" visuals
Plugin 'altercation/vim-colors-solarized' " color theme

""" general editing
Plugin 'tomtom/tcomment_vim' " comment toggling
Plugin 'tpope/vim-surround' " surround motions
Plugin 'tpope/vim-abolish' " smart find & replace
Plugin 'maxbrunsfeld/vim-yankstack' " go back/forward through yanked text
Plugin 'vim-scripts/Gundo' " undo tree visualizer
Plugin 'tpope/vim-repeat' " adds . repeat support for plugins
Plugin 'terryma/vim-expand-region' " progressively expand selected region
Plugin 'tpope/vim-unimpaired' " Pairs of operations

""" git support
Plugin 'mhinz/vim-signify' " VCS status in the gutter
Plugin 'tpope/vim-fugitive' " git commands in vim
Plugin 'gregsexton/gitv' " git tree viewer
Plugin 'tpope/vim-git' " git syntax etc

""" python
Plugin 'hynek/vim-python-pep8-indent' " indent python by the rules

""" IDE features
Plugin 'scrooloose/syntastic' " syntax checking
Plugin 'SirVer/ultisnips' " snippet collection
Plugin 'kien/ctrlp.vim' " fast file/buffer search
Plugin 'Valloric/YouCompleteMe' " auto completion

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
if iCanHazVundle == 0
    echo "Installing Plugins, please ignore key map error messages"
    echo ""
    :PluginInstall
endif


"""
""" Functions
"""

function! Preserve(command)
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
	execute a:command
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction

function! StripTrailing()
	call Preserve("%s/\\s\\+$//e")
endfunction

"""
""" General settings
"""

""" Sensible defaults
set backspace=indent,eol,start " normal BS
set whichwrap+=<,>,h,l   " cursor keys also wrap
set smarttab " Tabs work as you'd expect
set hidden " allow unsaved buffers
set history=1000 " save up to 1000 history entries
set showbreak=⇉ " Show line wrap
set listchars=tab:▸\ ,eol:¬ " tab/eol visible
set showmatch " show matching brackets
set autoread " automatically reload a file if it's changed outside vim
set visualbell " beeping sucks
set kp=":help" " use internal help
set spelllang=en_au " oi oi oi

" temp files
set noswapfile " dont use swap files
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

" Configure undo files (if we're in vim 7.3 and +persistent_undo has been
" compiled)
if has("persistent_undo")
   set undodir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
   set undofile
endif

" keep the netrw stuff from cluttering .vim
let g:netrw_home="~/.vim-netrw"

" search
set incsearch " always search incrementally
set hlsearch " highlight search terms
set ignorecase " ignore case in searches...
set smartcase " ...but not really. Case sensitive if capitals are included.

" indentation
set autoindent " indent me please
set smartindent " and use your brains
set cindent " c style indent
" 4 spaces instead of tabs
set softtabstop=4
set tabstop=4
set shiftwidth=4
set expandtab
" wrap settings
set wrap " wrap lines rather than use horiz. scrolling
set linebreak " try not to wrap in the middle of a word
set textwidth=0 " 80-character lines maximum

" format settings
" t - Auto-wrap text using textwidth
" c - Auto-wrap comments using textwidth, inserting the current comment
"     leader automatically.
" r - Automatically insert the current comment leader after hitting <Enter>
"     in Insert mode.
" q - Allow formatting of comments with "gq".
"     Note that formatting will not change blank lines or lines containing
"     only the comment leader. A new paragraph starts after such a line,
"     or when the comment leader changes.
" n - When formatting text, recognize numbered lists.
" 2 - When formatting text, use the indent of the second line of a paragraph
"     for the rest of the paragraph, instead of the indent of the first line.
" 1 - Don't break a line after a one-letter word. It's broken before it
"     instead (if possible).
set formatoptions=tcrqn21

" Automatically restore cursor position when possible
augroup DoRestore
	autocmd!
	autocmd BufReadPost *
	\ if line("'\"") > 1 && line("'\"") <= line("$") |
	\	exe "normal! g`\"" |
	\ endif
augroup END

set viminfo='100,<50,s10,h,%

""" Completion
set wildmenu                " completion with menu
set wildmode=longest,list   " bash-like tab completion
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows
set wildignore+=__pycache__,*.pyc,*pyo " Python
set wildignore+=.git,.svn,.hg " Ignore source control
set wildignore+=*.min.js " Ignore minified files


""" Diffs
set diffopt=iwhite " ignore whitespace changes

""" Enable solarized theme
set background=light
let g:solarized_termcolors=256
colorscheme solarized
set guifont=Monaco:h11
set guioptions=c " use console style dialogs 

""" Other visuals
set laststatus=2 " always show statusline
set ruler " show where we are
set cursorline " highlight cursor line
set showmode " display the current mode in the status bar
set showcmd " display unfinished commands
if &columns > 80
	" show line numbers when in a wide window
	set number
	set relativenumber
	autocmd InsertEnter * :set norelativenumber
	autocmd InsertLeave * :set relativenumber
endif

""" status bar
set statusline=
set statusline+=%f\                                           " filename
set statusline+=[%{strlen(&ft)?&ft:'none'}]                   " filetype
set statusline+=%h%1*%m%r%w%0*                                " flags
set statusline+=%=                                            " right align
set statusline+=%{fugitive#statusline()}                      " git status
set statusline+=\ (%l,%c%V)\ %<%P                             " offset

""" Warn @ 80 columns
set colorcolumn=80

"""
""" Filetype settings
"""

" interpret templates as smarty not html
autocmd BufNewFile,BufRead */_templates/*.html set filetype=smarty
" php uses hard tabs
autocmd filetype php set noexpandtab
" except .htPluginInfo no tabs
autocmd BufReadPost .htPluginInfo.php setlocal expandtab
" don't hide double quotes in json
autocmd filetype json setlocal conceallevel=0
" remove trailing crapola
autocmd FileType c,cpp,java,php,ruby,python,javascript,shell autocmd BufWritePre <buffer> :call StripTrailing()

"""
""" Plugin settings
"""

""" Syntastic
" turn off syntastic for c & html - it's too noisy
let g:syntastic_disabled_filetypes = ['html','c','cpp','h']
let g:syntastic_html_checkers = []
let g:syntastic_mode_map = { 'passive_filetypes': ['html'] }

" use signs to indicate lines with errors
" only if signs are available
if has('signs')
   let g:syntastic_enable_signs = 1
endif

" automatically open the location list when a buffer has errors
let g:syntastic_auto_loc_list=1

" use flake8 for python
let g:syntastic_python_checkers = ['flake8']

""" CtrlP
let g:ctrlp_map = '' " don't takeover the default <c-p>
let g:ctrlp_working_path_mode = 'ra' " try to find project root

"""
""" Keybindings
"""

" search
nnoremap <Leader>a :Ag<Space>
nnoremap <Leader>A :Ag<Space> <cword><CR>
nnoremap // :nohlsearch<CR>

" copy and paste to system clipboard
vnoremap <Leader>y "+y
vnoremap <Leader>d "+d
nnoremap <Leader>p "+p
nnoremap <Leader>P "+P
vnoremap <Leader>p "+p
vnoremap <Leader>P "+P

" jump to end of paste
vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]

" select text just pasted
noremap gV `[v`]

" Visual mode
" nnoremap <Leader><Leader> V

" expand region
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

" open recently edited
nnoremap <Leader>m :CtrlPMRU<CR>
" open buffers
nnoremap <Leader>b :CtrlPBuffer<CR>
" open files
nnoremap <Leader>f :CtrlP<CR>
" all
nnoremap <Leader><Leader> :CtrlPMixed<CR>
" tags
nnoremap <Leader>t :CtrlPTag<CR>

" save
nnoremap <Leader>w :w<CR>

" quit
nnoremap <Leader>q :q<CR>

" Undo
nnoremap <Leader>u :GundoToggle

" BS/Enter to go to start/end of file
nnoremap <BS> gg
nnoremap <Enter> G

" TODO: mappings for tests

""" vp doesn't replace paste buffer
function! RestoreRegister()
  let @" = s:restore_reg
  return ''
endfunction
function! s:Repl()
  let s:restore_reg = @"
  return "p@=RestoreRegister()\<cr>"
endfunction
vmap <silent> <expr> p <sid>Repl()
