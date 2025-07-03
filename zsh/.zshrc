# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"
plugins=(git)
source $ZSH/oh-my-zsh.sh

# User configuration
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

# set alias
if [ -f ~/.aliases ]; then
    . ~/.aliases
fi

# external functions
if [ -f ~/.functions ]; then
    . ~/.functions
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
if [ -d "$HOME/scrpts/" ] ; then
  PATH="$HOME/scrpts:$PATH"
fi

# set composer path if exist
if [ -d "$HOME/.config/composer/vendor/bin" ] ; then
  PATH="$HOME/.config/composer/vendor/bin:$PATH"
fi

# set path if directory exitst
if [ -d "$HOME/.local/bin" ] ; then
  PATH="$HOME/.local/bin:$PATH"
fi

eval "$(starship init zsh)"
