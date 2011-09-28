" Set tabs to 2 spaces
set tabstop=8
set shiftwidth=2
set softtabstop=2
set expandtab

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

colorscheme herald
syntax on
set ruler

" Set current window at least 84 wide and as tall as possible
" while leaving other windows 5 lines tall
set winwidth=84
set winheight=5
set winminheight=5
set winheight=999

" set guifont=gohufont-11
set guifont=gohufont-14
" set guifont=Bitstream