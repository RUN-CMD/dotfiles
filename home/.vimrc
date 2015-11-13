syntax enable
set background=dark
colorscheme solarized

set expandtab
set tabstop=2
set shiftwidth=2

set number

set guicursor+=a:blinkon0

nnoremap <F6> $v%lohc<CR><CR><Up><C-r>"<Esc>:s/,/,\r/g<CR>:'[,']norm ==<CR>
