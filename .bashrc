# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

#Plugins
#source ~/dotfiles/bashplugins/bash-powerline.sh

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
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
    alias cgrep='egrep -rni --include \*.C --include \*.h --include \*.cpp'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'


#alias for quickly resourcing the .bashrc
alias rb='source ~/.bashrc'

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
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# aliases

# alias that solves Wifi Issues
alias fixwifi='sudo /etc/init.d/network-manager restart'

# program aliases
alias gmsh='gmsh -fontsize 24'

## folder navigation
alias ..='cd ..'
alias ...='cd ...'
alias ....='cd ....'

alias .....='cd .....'
alias p='pwd'
alias l='ls -l'

## date and time
alias now='date +"%T"'
alias nowtime=now
alias nowdate='date +"%d-%m-%Y"'

## other
alias c='clear'
alias path='echo -e ${PATH//:/\\n}'
alias f='fg'


## Farhat Resaerch Group specific stuff
export INDYDIR=/home/lukas/Desktop/project/independence
alias SDESIGN='$INDYDIR/codes/sdesign.d/Executables.d/sdesign.Linux.opt'
alias indX='ssh -X lscheuch@independence.stanford.edu' 
alias ind='ssh lscheuch@independence.stanford.edu'

alias mountind='sshfs lscheuch@independence.stanford.edu:/home/lscheuch /home/lukas/Desktop/project/independence'

#aliases specifically for independence cluster
alias gmsh2top='/home/pavery/bin/gmsh2top'
alias partnmesh='/home/pavery/bin/partnmesh'
alias partdmesh='/home/pavery/bin/partdmesh'
alias sower='/home/pavery/bin/sower'
alias xp2exo='/home/pavery/bin/xp2exo'
alias rob='/home/pavery/bin/rob'
alias nas2fem='/home/pavery/bin/nas2fem'
alias cd2tet='/home/pavery/bin/cd2tet'
alias matcher='/home/pavery/bin/matcher'

alias eclipse='/home/lscheuch/Downloads/eclipse/eclipse'

alias valgrind='/home/pavery/valgrind/bin/valgrind'

alias iqsub6='qsub -I -l -q sandybridge nodes=1:ppn=6'
alias iqsub12='qsub -I -l -q sandybridge nodes=1:ppn=12'
alias iqsub16='qsub -I -l -q sandybridge nodes=1:ppn=16'

alias qstatloop='while :; do qstat -a; sleep 2s; done'


set_title() 
{
  ORIG=$PS1
  TITLE="\e]2;$*\a"
  PS1=${ORIG}${TITLE}
}
