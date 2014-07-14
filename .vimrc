" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2014 Feb 05
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Configure Plugins
set nocompatible
filetype off
" set the runtime path to include vundle and initialize
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
" let vundle manage vundle
Plugin 'gmarik/vundle'

" Configure my plugins
Plugin 'majutsushi/tagbar'
Plugin 'Lokaltog/vim-powerline'
Plugin 'Valloric/YouCompleteMe'
Plugin 'vim-scripts/TagHighlight'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'vim-scripts/taglist.vim'
Plugin 'vim-scripts/winmanager'
Plugin 'vim-scripts/ZoomWin'
Plugin 'scrooloose/nerdtree'
Plugin 'mileszs/ack.vim'
"Plugin 'WolfgangMehner/vim-plugins'
"Plugin 'scrooloose/syntastic'
"Plugin 'xolox/vim-misc'
"Plugin 'xolox/vim-easytags'


" color scheme
"Plugin 'nanotech/jellybeans'
"Plugin 'jnurmine/Zenburn'
"Plugin 'fugalh/desert'

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file (restore to previous version)
  set undofile		" keep an undo file (undo changes after closing)
endif
" Config backup and undo dir
set backupdir=~/.backup
set undodir=~/.backup
"set nobackup


set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif
syntax enable
colorscheme mylove

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

" Configure for Plugin vundle
nnoremap <silent> <F9> :TagbarToggle<CR>
let g:tagbar_left = 1
let g:tagbar_width = 30 
let g:tagbar_sort = 0

" Configure for Plugin bufexplorer
"nnoremap <silent> <F8> :BufExplorer<CR>
nnoremap <silent> <F6> :BufExplorerVerticalSplit<CR>

" Configure for Plugin taglist
nnoremap <silent> <F8> :TlistToggle<CR>
let TlistExit_OnlyWindow = 1
let Tlist_Use_Right_Window = 1
let Tlist_Auto_Highlight_Tag = 1

" Configure for Plugin nerdtree
nnoremap <silent> <F7> :NERDTreeToggle<CR>
let NERDTreeWinPos='right'
let NERDTreeQuitOnOpen=1

" Configure for Ack
let g:ackprg = "ack-grep"
let g:ack_default_options = ""

" Configure for Plugin winmanager
"nnoremap <silent> <F8> :WMToggle<CR>
"let g:winManagerWidth = 30
"let g:winManagerWindowLayout = 'BufExplorer|TagList'
"let g:winManagerOnRightSide = 1

" Configure for Plugin powerline
set laststatus=2
"set encoding=utf-8
set t_Co=256
"let g:Powerline_symbols='fancy'

" Configure for Plugin YCM
let g:ycm_confirm_extra_conf = 0
let g:ycm_complete_in_comments = 1
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_global_ycm_extra_conf='~/.vim_conf/.ycm_extra_conf.py'

" Configure syntastic
"let g:syntastic_mode_map = { 'mode': 'passive',}
"let g:syntastic_check_on_open=0
"let g:syntastic_check_on_wq=0
"let g:syntastic_enable_highlighting=0

" Configure for ctags
set tags=~/.tags/tags
"set tags=~/.tags/tags
"set tags+=./tags
"set tags+=~/.tags/commtags

" taghighlight
"UpdateTypesFileOnly

" Configure for easytags
"let g:easytags_file='~/.tags/tags'
"let g:easytags_dynamic_file=1
"let g:easytags_always_enable=1
"let g:easytags_updatetime_warn=0
"let g:easytags_updatetime_min=1000
"let g:easytags_include_members=1


" ###### my setting #####
set number
set autochdir
set autoread
set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab
