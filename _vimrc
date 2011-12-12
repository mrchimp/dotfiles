" Set tabs to 2 spaces
set tabstop=8
set shiftwidth=2
set softtabstop=2
set expandtab
set autoindent

" Turn on line numbers
set number

" Automatically detect file types
filetype on

" Colourscheme browsing
"map <silent><f3> :NEXTCOLOR<cr>
"map <silent><f2> :PREVCOLOR<cr>

" NERDTree file browser
map <silent><F10> :NERDTree C:/XAMPP/htdocs<cr><cr>

" Code folding
map <silent><F5> zfa}
map <silent><F6> zo
map <silent><F7> zc

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
:map <C-F1> w:!C:/users/jgully/MB_Compile_105.bat "%" <CR><CR>
:map <C-F2> w:!C:/users/jgully/MB_Run_105.bat "%" <CR><CR>
:map <C-F3> w:!C:/users/jgully/MB_Link_105.bat "%" <CR><CR>


" Show containing folder - ctrl-f5
if has("gui_running")
  if has("win32")
    :map <silent> <C-F5> :if expand("%:p:h") != ""<CR>:!start explorer.exe %:p:h<CR>:endif<CR><CR>
  endif
endif

