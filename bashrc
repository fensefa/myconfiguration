# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
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
export PYTHONPATH=$PYTHONPATH:~/libpy:~/.local/lib/python2.7
export PATH=~/bin:~/.local/bin:$PATH
export VISUAL=vim
export HISTFILESIZE=10000
export HISTCONTROL=ignoreboth:erasedups
# for heap checker
export PPROF_PATH=/usr/local/bin/pprof
alias vi=vim
alias gcc="color_compile gcc"
alias g++="color_compile g++"
alias make="color_compile make"
alias pyspark='/home/xujiang/download/spark-2.1.0-bin-hadoop2.7/bin/pyspark'
alias mhead='make | head'

# core dump file
ulimit -c unlimited

parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

function iterm2_print_user_vars() {
    iterm2_set_user_var gitBranch $((git branch 2> /dev/null) | grep \* | cut -c3-)
    iterm2_set_user_var hostName $(hostname)
    iterm2_set_user_var ip $(hostname -i)
}

export PS1="[\u@\h \W]\[\033[32m\]\$(parse_git_branch)\[\033[00m\]$ "
export PS1="[\u \W]\[\033[32m\]\$(parse_git_branch 2>/dev/null)\[\033[00m\]$ "

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"
