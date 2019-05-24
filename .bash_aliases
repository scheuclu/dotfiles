alias tmux='tmux -2'
alias rb='source ~/.bashrc'

set_title()
{
  ORIG=$PS1
  TITLE="\e]2;$*\a"
  PS1=${ORIG}${TITLE}
}
