# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
    # We have color support; assume it's compliant with Ecma-48
    # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
    # a case would tend to support setf rather than setaf.)
    color_prompt=yes
    else
    color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
# if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
#     . /etc/bash_completion
# fi


export PATH='/Users/zhaoze/bin'/depot_tools:"$PATH"

source ~/.git-prompt.sh

function prompt() {
  local BLACK="\[\033[0;30m\]"
  local BLACKBOLD="\[\033[1;30m\]"
  local RED="\[\033[0;31m\]"
  local REDBOLD="\[\033[1;31m\]"
  local GREEN="\[\033[0;32m\]"
  local GREENBOLD="\[\033[1;32m\]"
  local YELLOW="\[\033[0;33m\]"
  local YELLOWBOLD="\[\033[1;33m\]"
  local BLUE="\[\033[0;34m\]"
  local BLUEBOLD="\[\033[1;34m\]"
  local PURPLE="\[\033[0;35m\]"
  local PURPLEBOLD="\[\033[1;35m\]"
  local CYAN="\[\033[0;36m\]"
  local CYANBOLD="\[\033[1;36m\]"
  local WHITE="\[\033[0;37m\]"
  local WHITEBOLD="\[\033[1;37m\]"
  export PS1="$GREEN\$(__git_ps1)$YELLOW\w\$$WHITE "
}

prompt

findd() {  find . -iname "*$1*" | more; }

greppw() {
  string=`echo $1 | sed 's/ / --and -e /g'`;
  if [ $# -eq 2 ]
    then
    git grep -Win $string -- "*.$2"
  else
    git grep -Win $string
  fi
}

grepp() {
  string=`echo $1 | sed 's/ / --and -e /g'`;
  if [ $# -eq 2 ]
    then
    git grep -ine $string -- "*.$2"
  else
    git grep -ine $string
  fi
}

wk() {
  if [[ "$PWD" == *src* ]]; then
    cd ${PWD/"src"*/"src/third_party/WebKit"}
  else
    echo "Not in source folder."
  fi
}

src() {
  if [[ "$PWD" == *src* ]]; then
    cd ${PWD/"src"*/"src"}
  else
    echo "Not in source folder."
  fi
}

export CLICOLOR=1

export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

# alias vim="mvim"
# alias vi="mvim"

alias prebuild="./build/gyp_chromium"
alias zbuild="time ninja -C out/Release content_shell"
alias sbuild="time ninja -C out/Release blink_tests"
export GREP_OPTIONS='--color=auto'

if [ -f `brew --prefix`/etc/bash_completion ]; then
        . `brew --prefix`/etc/bash_completion
fi
alias ps='ps aux | grep '
alias clang++="clang++ -std=c++11"
alias elasshutdown="curl -XPOST 'http://localhost:9200/_cluster/nodes/_local/_shutdown'"
alias ir='cd ~/workspace/ir/project/assignment3'
alias content_shell="./out/Release/Content\ Shell.app/Contents/MacOS/Content\ Shell"
alias setupccache=". /Users/zhaoze/bin/setupccache"
alias gcc="/usr/local/Cellar/gcc/4.9.2_1/bin/gcc-4.9"
alias g++="/usr/local/Cellar/gcc/4.9.2_1/bin/g++-4.9 -std=c++11"
# alias g++="g++ -std=c++11"
alias zhaoze='ssh zhaozezh@login.ccs.neu.edu'
alias vi='vim'
alias gs='git status'
alias ga='git add'
alias gd='git diff'
alias len='du -hs'
alias chou='ssh zhaozezh@gunbuster.ccs.neu.edu'

