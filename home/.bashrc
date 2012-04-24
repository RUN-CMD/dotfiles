# .bashrc

if [ -f ~/.bashrc_ubuntu ]; then
   source ~/.bashrc_ubuntu
fi


# User specific aliases and functions

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias ls='ls -hal1'
alias lsd='ls -hal1 | grep ^d'
alias cuc='cucumber --tags ~@watir'
alias cucp='cucumber -fprogress --tags ~@watir'
alias git-wtf='~/script/git-wtf'

# Source global definitions
if [ -f /etc/bashrc ]; then
        . /etc/bashrc
fi

# put git branch in prompt

function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

# bang if git working dir is dirty
function git_dirty {
  git diff --quiet HEAD &>/dev/null
  [ $? == 1 ] && echo "!" 
}

function prompt {
  local        BLUE="\[\033[0;34m\]"
  local         RED="\[\033[0;31m\]"
  local   LIGHT_RED="\[\033[1;31m\]"
  local       GREEN="\[\033[0;32m\]"
  local LIGHT_GREEN="\[\033[1;32m\]"
  local      YELLOW="\[\033[0;33m\]"
  local       WHITE="\[\033[1;37m\]"
  local  LIGHT_GRAY="\[\033[0;37m\]"
  local        NONE="\[\033[0m\]"
  case $TERM in
    xterm*)
    TITLEBAR='\[\033]0;\u@\h:\w\007\]'
    ;;
    *)
    TITLEBAR=""
    ;;
  esac

PS1="${TITLEBAR}\
$LIGHT_GRAY\u@\h:\w$YELLOW\$(parse_git_branch)\
$RED\$(git_dirty)$NONE\$ "
PS2='> '
PS4='+ '
}
prompt

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
