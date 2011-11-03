" Set tabs to 2 spaces
set tabstop=8
set shiftwidth=2
set softtabstop=2
set expandtab
set autoindent

"Automatically detect file types
filetype on

" Colourscheme browsing
map <silent><f3> :NEXTCOLOR<cr>
map <silent><f2> :PREVCOLOR<cr>

" NERDTree file browser
map <silent><F10> :NERDTree C:/XAMPP/htdocs<cr><cr>

" Code folding
map <silent><F5> zfa}
map <silent><F6> zo
map <silent><F7> zc

" Set current window at least 84 wide and as tall as possible
" while leaving other windows 5 lines tall
set winwidth=84
set winheight=5
set winminheight=5
set winheight=999

" Make it look pretty
if has ("gui_running")
  colorscheme herald
else 
  colorscheme dawn
endif
syntax on
set ruler

" Gohu font: http://font.gohu.eu/
set guifont=gohufont-14

" Taglist Shortcut
" Requires Vim-Taglist - http://vim-taglist.sourceforge.net/
" Which in turn requires Exuberant Ctags - http://ctags.sourceforge.net/
nnoremap <silent><F9> :TlistToggle<CR>

autocmd FileType python setlocal shiftwidth=4 tabstop=8 softtabstop=4

" Set up MapBasic support
function Mb_setup()
  set filetype=vb
  set efm=(%f:%l)\ %m
endfunction
au BufNewFile,BufRead *.mb execute Mb_setup()

" map keys ---- mapbasic compile and run
:map <f3> w:!C:/users/jgully/MB_Compile_105.bat "%" <CR><CR>
:map <f4> w:!C:/users/jgully/MB_Run_105.bat "%" <CR><CR>
