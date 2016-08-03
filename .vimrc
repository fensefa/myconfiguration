" My configuration for vim
" Last edition: 2016-04-22 

set nu
set hlsearch " heightlight serch
syntax on
set cindent
set autoindent
set softtabstop=4
set shiftwidth=4
set tabstop=4
set expandtab
set mouse=a

filetype plugin indent on

imap <C-z> <ESC>ui
map <C-z> <ESC>u
imap <C-s> <ESC>:w<CR>i
map <C-s> <ESC>:w<CR>

" Those may work only on linux, not on mac
imap <C-v> <S-Insert>
map <C-v> <S-Insert>
inoremap <S-Insert> <ESC>:set paste<CR>i<S-Insert><ESC>:set nopaste<CR>i
noremap <S-Insert> <ESC>:set paste<CR>i<S-Insert><ESC>:set nopaste

inoremap ( ()<ESC>i
inoremap [ []<ESC>i
inoremap { <c-r>=BigPair()<CR>
inoremap ) <c-r>=ClosePair(')')<CR>
inoremap ] <c-r>=ClosePair(']')<CR>
inoremap } <c-r>=CloseBracket()<CR>
func! BigPair()
    if &filetype == "cpp"
        return "{\<CR>}\<ESC>O"
    elseif &filetype == "c"
        return "{\<CR>}\<ESC>O"
    elseif &filetype == "java"
        return "{\<CR>}\<ESC>O"
    else
        return "{}\<ESC>i"
    endif
endfunc
func! ClosePair(char)
    if getline('.')[col('.') - 1] == a:char
        return "\<Right>"
    else
        return a:char
    endif
endfunc
func! CloseBracket()
    if &filetype == "cpp"
        return CloseCppBracket()
    elseif &filetype == "c"
        return CloseCppBracket()
    elseif &filetype == "java"
        return CloseCppBracket()
    else
        return ClosePair('}')
    endif
endfunc
func! CloseCppBracket()
    if match(getline(line('.') + 1), '^\s*}$') < 0
        return "\<CR>}"
    endif
    if match(getline(line('.')), '^\s*$') < 0
        return "\<ESC>j0f}a"
    else
        return "\<ESC>ddj0f}a"
    endif
endfunc
    
set completeopt=longest,menu

" Press <F5> to compile and run code
imap <F5> <ESC>:call CompileRunGcc()<CR>
map <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
    exec "w"
    if &filetype == 'c'
        exec "!gcc % -o %<"
        exec "! ./%<"
    elseif &filetype == 'cpp'
        exec "!g++ % -o %<"
        exec "! ./%<"
    elseif &filetype == 'java' 
        exec "!javac %" 
        exec "!java %<"
    elseif &filetype == 'sh'
        exec "!sh %"
    elseif &filetype == 'python'
        exec "!python %"
    endif
endfunc

" Press <F7> to complile the code
imap <F7> <ESC>:call CompileGcc()<CR>
map <F7> :call CompileGcc()<CR>
func! CompileGcc()
    exec "w"
    if &filetype == 'c'
        exec "!gcc % -o %<"
    elseif &filetype == 'cpp'
        exec "!g++ % -o %<"
    elseif &filetype == 'java' 
        exec "!javac %"
    elseif &filetype == 'sh'
	exec "!sh -n %"
    endif
endfunc

" Press <F8> to run gdb and begin debug
imap <F8> <ESC>:call Rungdb()<CR>
map <F8> :call Rungdb()<CR>
func! Rungdb()
    exec "w"
    exec "!g++ % -g -o %<"
    let os = substitute(system('uname'), "\n", "", "")
    if os == 'Darwin'
	    exec "!lldb ./%<"
    elseif os == 'Linux'
	    exec "!gdb ./%<"
    endif
endfunc

" Let vim remember the last editing position
autocmd BufReadPost * exec ":call SetPosition()"
func! SetPosition()
    if line("'\"")>0&&line("'\"")<=line("$")
        exec "normal g'\""
    endif
endfunc

" Set file title according to its type
autocmd BufNewFile *.py exec ":call SetPyTitle()"
func! SetPyTitle()
    call setline(1,"#!usr/bin/env python")
    call setline(2,"# -*- coding: utf-8 -*-")
endfunc
autocmd BufNewFile *.sh exec ":call SetBashTitle()"
func! SetBashTitle()
    call setline(1,"#!usr/bin/env bash")
endfunc
