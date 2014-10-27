"pathogen plugin
execute pathogen#infect()
set nu
set expandtab
set tabstop=4
let Tlist_Ctags_Cmd='/usr/local/bin/ctags'
map NERDTree tree
"map :NERDTreeToggle
filetype off
filetype plugin indent off
set runtimepath+=$GOROOT/misc/vim

syntax on
filetype plugin indent on
"autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType python setlocal et sta sw=4 sts=4
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
"autocmd FileType go setlocal noexpandtab shiftwidth=4 tabstop=4 softtabstop=4 nolist
autocmd FileType go autocmd BufWritePre <buffer> Fmt
autocmd FileType text setlocal textwidth=78
autocmd BufReadPost *
                    \ if line("'\"") > 1 && line("'\"") <= line("$") |
                    \ exe "normal! g`\"" |
                    \ endif
let g:pydiction_location = '/Users/zdonking/.vim/after/ftplugin/complete-dict'
let g:pydiction_menu_height = 20


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
map <F10> :w<cr>:!make clean && make  <CR>
":W --> :w
:cmap W<CR> :w <CR>
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%121v.\+/


"imap <c-space> <c-x><c-o>
"
"1
"set guifont=Bitstream_Vera_Sans_Mono:h9:cANSI "记住空格用下划线代替哦
set guifont=Consolas\ 11.5
"set gfw=幼圆:h10:cGB2312
set laststatus=2
set formatoptions=tcrqn
"set cindent
autocmd InsertLeave * se nocul
autocmd InsertEnter * se cul
set foldenable
set foldmethod=manual
nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>
set softtabstop=2
set shiftwidth=2
:set tags=/Users/zdonking/study_dt_al/hmwk/tags
set tags+=~/.vim/tags/st
"map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>
filetype plugin on
map <silent> <F9> :TlistToggle<cr>
