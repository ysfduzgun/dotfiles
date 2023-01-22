#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1=' \W  '


## Hist append
shopt -s histappend
PROMPT_COMMAND="history -a;$PROMPT_COMMAND"

## Bin Path

if [ -d "$HOME/.bin" ] ; then
    PATH="$HOME/.bin:$PATH"
fi
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi
