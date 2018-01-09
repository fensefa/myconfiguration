# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

if [ -f /etc/bash_input ]; then
	. /etc/bashrc
fi

if [ `uname` == Darwin ]
then
    echo Hello, Darwin
    alias ll='ls -l'
    alias vi='vim'
    export CLICOLOR=1
    export LSCOLORS=gxfxaxdxcxegedabagacad
    export HISTCONTROL=ignoreboth
fi
if [ `uname` == Linux ]
then
    echo Hello, Linux
fi

# User specific aliases and functions
export LANG=en_US.utf-8
export PATH=~/.local/bin:$PATH
export VISUAL=vim
export HISTFILESIZE=10000
export HISTCONTROL=ignoreboth:erasedups
alias vi=vim
alias mhead='make | head'

# core dump file
ulimit -c unlimited

parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

export PS1="[\u \W]\[\033[32m\]\$(parse_git_branch 2>/dev/null)\[\033[00m\]$ "
