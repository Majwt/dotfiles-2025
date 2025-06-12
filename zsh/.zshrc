#!/usr/bin/env zsh
# q: how do i add something to the path?
export PATH=$PATH:$HOME/.local/bin

export GITHUB_USER=Majwt



export HISTFILE=$ZDOTDIR/.hist_zsh
export HISTSIZE=5000000
export SAVEHIST=$HISTSIZE

# HISTORY
setopt EXTENDED_HISTORY          # Write the history file in the ':start:elapsed;command' format.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire a duplicate event first when trimming history.
setopt HIST_FIND_NO_DUPS         # Do not display a previously found event.
setopt HIST_IGNORE_ALL_DUPS      # Delete an old recorded event if a new event is a duplicate.
setopt HIST_IGNORE_DUPS          # Do not record an event that was just recorded again.
setopt HIST_IGNORE_SPACE         # Do not record an event starting with a space.
setopt HIST_SAVE_NO_DUPS         # Do not write a duplicate event to the history file.
# END HISTORY

bindkey '^P' history-beginning-search-backward
bindkey '^N' history-beginning-search-forward

export EDITOR=nvim
export VISUAL=nvim
export XDG_CONFIG_HOME=$HOME/.config

# Load aliases if they exist
if [ -f $XDG_CONFIG_HOME/zsh/aliases ]; then
  source $XDG_CONFIG_HOME/zsh/aliases
fi

setopt PROMPT_SUBST

# shortcut to edit zshrc
alias zrc="chezmoi edit $HOME/.zshrc"

# shortcut to source zshrc
alias szrc="source $HOME/.zshrc"

# vi keybindings
# bindkey -v

# Editor
autoload -z edit-command-line
zle -N edit-command-line
bindkey -M vicmd 'v' edit-command-line

bindkey -e

# zsh case-insensitive completion
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'


eval "$(starship init zsh)"
eval "$(leetcode completions)"
eval "$(chezmoi completion zsh)"



source $XDG_CONFIG_HOME/zsh/fzf_config
source "$(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
# eval "$(gh copilot alias -- zsh)"
