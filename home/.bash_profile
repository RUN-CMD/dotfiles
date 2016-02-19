export PATH=/usr/local/bin:$PATH
eval "$(rbenv init -)"

export NVM_DIR="/Users/ksandwich/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# vim terminal editing mode
set -o vi
set editing-mode vi

# Aliases
alias cda='cd ~/src/ruby_agent/'
alias cdd='cd ~/src/ruby_agent/'
alias cg='cd ~/src/gems/'
alias be='bundle exec'
alias bb='bundle install'
alias qh="NEW_RELIC_DATA_REPORT_PERIOD='10'" # "Quick Harvest"
alias acki='ack -i'
alias glh='git lg | head'
alias dot='dot -Tpng:quartz:quartz'

# Prompt
function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

# Add a bang to the prompt if git working dir is dirty
function git_dirty {
  git diff --quiet HEAD &>/dev/null
  [ $? == 1 ] && echo "!" 
}

function current_ruby {
  ruby -v | cut -d" " -f2
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
$LIGHT_GRAY\u@\h:\
$RED(\$(current_ruby))$LIGHT_GRAY\
\w$YELLOW\$(parse_git_branch)\
$RED\$(git_dirty)$NONE\$ "
PS2='> '
PS4='+ '
}
prompt

# Helpers
source /usr/local/share/chruby/chruby.sh

# Set the default ruby
chruby 2.3.0
