set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

let g:python3_host_prog = '/usr/local/bin/python3'

tnoremap <silent> <C-[> <C-\><C-n>
