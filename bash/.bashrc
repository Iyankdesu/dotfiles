# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
#                                                                     #
#                                                                     #
#           ██████╗  █████╗ ███████╗██╗  ██╗██████╗  ██████╗          #
#           ██╔══██╗██╔══██╗██╔════╝██║  ██║██╔══██╗██╔════╝          #
#           ██████╔╝███████║███████╗███████║██████╔╝██║               #
#           ██╔══██╗██╔══██║╚════██║██╔══██║██╔══██╗██║               #
#           ██████╔╝██║  ██║███████║██║  ██║██║  ██║╚██████╗          #
#           ╚═════╝ ╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝          #
#                                                                     #
#                                                                     #
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

# if not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# enable vi style editing
set -o vi

# history time format
HISTTIMEFORMAT="%F %T "

# don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth

# set history file path
HISTFILE=$HOME/.local/share/history

# set maximum number of lines of history
HISTSIZE=20000

# set maximum number of lines to history file
HISTFILESIZE=20000

# enable auto cd
shopt -s autocd

# append to the history file, don't overwrite it
shopt -s histappend

# set alias
if [ -f ~/.aliases ]; then
    . ~/.aliases
fi

# preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# preferred compilations flag
export ARCHFLAGS="-arch x86_64"

# enable support for 256 color
export TERM=xterm-256color

# preferred pager for man (manual pager utils)
export MANPAGER="bat --style plain"

# set scripts path if exist
if [ -d "$HOME/Scripts/" ] ; then
  PATH="$HOME/Scripts:$PATH"
fi

# set composer path if exist
if [ -d "$HOME/.config/composer/vendor/bin" ] ; then
  PATH="$HOME/.config/composer/vendor/bin:$PATH"
fi

# set path if directory exitst
if [ -d "$HOME/.local/bin" ] ; then
  PATH="$HOME/.local/bin:$PATH"
fi

# initialize starship
eval "$(starship init bash)"

# function show file size in a directory
function duh(){
  du -h -x -s -- * | sort -r -h
}

function print_exe(){
  find $(echo $PATH | tr ':' ' ') -type f -perm /u+x
}

# color output
bind "set colored-stats on"
bind "set colored-completion-prefix on"

# bash completion
bind "set completion-ignore-case on"
bind "set show-all-if-ambiguous on"
bind "set menu-complete-display-prefix on"
bind "TAB:menu-complete"

# bash keybinding
bind -x '"\C-l": clear -x'
bind '"\C-a": beginning-of-line'
bind '"\C-e": end-of-line'
bind '"\C-u": backward-kill-line'

# history keybinding
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'
