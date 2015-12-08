export PATH=/usr/local/bin:$PATH
eval "$(rbenv init -)"

export NVM_DIR="/Users/ksandwich/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# vim terminal editing mode
set -o vi

# Aliases

# Jekyll ack-grep
alias jack="ack --ignore-dir=_site"

# Prompt
function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

# Add a bang to the prompt if git working dir is dirty
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
