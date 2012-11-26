" Set tabs to 2 spaces
set tabstop=8
set shiftwidth=2
set softtabstop=2
set expandtab
set autoindent

" ..except in python files use four spaces to indent
autocmd FileType python setlocal shiftwidth=4 tabstop=8 softtabstop=4

" Turn on line numbers
set number

" Automatically detect file types
filetype on

" Set current window at least 84 wide and as tall as possible
" while leaving other windows 5 lines tall
"set winwidth=84
"set winheight=5
"set winminheight=5
"set winheight=999

" Make it look pretty
if has ("gui_running")
  colorscheme herald
else 
  colorscheme dawn
endif
set background=dark
syntax on
set ruler

" Gohu font: http://font.gohu.eu/
set guifont=gohufont-14

"#### keyboard shortcuts ####

" Colourscheme browsing
map <silent><f2> :PREVCOLOR<cr>
map <silent><f3> :NEXTCOLOR<cr>

" Code folding
map <silent><F5> zfa}
map <silent><F6> zo
map <silent><F7> zc

" Show containing folder - ctrl-f5
if has("gui_running")
  if has("win32")
    :map <silent> <C-F5> :if expand("%:p:h") != ""<CR>:!start explorer.exe %:p:h<CR>:endif<CR><CR>
  endif
endif

" Taglist Shortcut
" Requires Vim-Taglist - http://vim-taglist.sourceforge.net/
" Which in turn requires Exuberant Ctags - http://ctags.sourceforge.net/
nnoremap <silent><F9> :TlistToggle<CR>

" NERDTree file browser
" map <silent><F10> :NERDTree C:/XAMPP/htdocs<cr><cr>