"pathogen plugin
"execute pathogen#infect()
set nu
set expandtab
set tabstop=4
filetype off
filetype plugin indent off

syntax on
filetype plugin indent on
"autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType python setlocal et sta sw=4 sts=4
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
"autocmd FileType go setlocal noexpandtab shiftwidth=4 tabstop=4 softtabstop=4 nolist

function CheckPythonSyntax()
    let mp = &makeprg
    let ef = &errorformat
    let exeFile = expand("%:t")
    setlocal makeprg=python\ -u
    set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m
    silent make %
    copen
    let &makeprg     = mp
    let &errorformat = ef
endfunctio
"f5 --> check-python-syntax
map <F5> :call CheckPythonSyntax()<CR>
"f6 --> save && :!python current-file
map <F6> :w<cr>:!python % <CR>
":W --> :w
:cmap W<CR> :w <CR>
"set cindent
"autocmd InsertLeave * se nocul
"autocmd InsertEnter * se cul
set foldenable
set foldmethod=manual
set softtabstop=2
set shiftwidth=2
filetype plugin on
set tags=~/.vim/tags/cpp
"set tags=~/.vim/tags/systags
set tags+=~/.vim/tags/studytag
map <silent> <F9> :TlistToggle<cr>
map <F10> :w<cr>:!make clean && make  <CR>
map [[ :po<CR>
map <C-F12> :!ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
