if [ -f /etc/bashrc ]
then
    source /etc/bashrc
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

export HISTCONTROL=ignoreboth:erasedups

export PATH=$PATH:~/bin
export PYTHONPATH=$PYTHONPATH:~/libpy
