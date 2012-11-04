# Custom OSX bits.

# Determine current directory
SOURCE="${BASH_SOURCE[0]}"
BASH_ROOT="$( dirname "$SOURCE" )"
while [ -h "$SOURCE" ]
do
  SOURCE="$(readlink "$SOURCE")"
  [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE"
  BASH_ROOT="$( cd -P "$( dirname "$SOURCE"  )" && pwd )"
done
export BASH_ROOT="$( cd -P "$( dirname "$SOURCE" )" && pwd )"

# common stuff
source $BASH_ROOT/common.bash

export WORKON_HOME=$HOME/.virtualenvs
export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python
source /usr/local/bin/virtualenvwrapper.sh

_virtualenvs ()
{
    local cur="${COMP_WORDS[COMP_CWORD]}"
    COMPREPLY=( $(compgen -W "`ls $WORKON_HOME`" -- ${cur}) )
}

complete -o default -o nospace -F _virtualenvs workon
complete -o default -o nospace -F _virtualenvs rmvirtualenv

# path setup
export GEM_HOME=$HOME/.gems
export SLASH_BIN_HOME=$HOME/dot-bin
export PATH=/opt/local/bin:/opt/local/sbin:/usr/local/bin:$GEM_HOME:$PATH
export PATH=$SLASH_BIN_HOME:/usr/local/sbin:/usr/local/share/python:$PATH

# git completion
source $BASH_ROOT/git-completion.bash
source $BASH_ROOT/git-flow-completion.bash

alias ls="ls -G"
export CLICOLORS=1
export LSCOLORS=dxfxcxdxbxegedabagacad
# export LSCOLORS=GxFxCxDxBxegedabagaced
alias clean_dir='find . -name ".DS_Store" -depth -exec rm {} \;'
export VISUAL=vim