####################################################
# zsh
####################################################

# autocomplete
autoload -U +X bashcompinit && bashcompinit
autoload -U +X compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# search
setopt auto_cd
setopt auto_list
setopt auto_menu
zstyle ':completion:*:default' menu select=2
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
# zstyle ':completion:*' matcher-list '' 'm:{[:lower:]}={[:upper:]}' '+m:{[:upper:]}={[:lower:]}'
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# history
export LANG=ja_JP.UTF-8
setopt share_history
HISTFILE=$HOME/.zsh_history
HISTSIZE=100000
SAVEHIST=100000
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS

# auto suggestiongs
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export FZF_DEFAULT_OPTS='--height 80% --reverse --border'

function fzf_history() {
  BUFFER=$(history -n -r 1 | fzf --no-sort +m --query "$LBUFFER" --prompt="History > ")
  CURSOR=$#BUFFER
  zle reset-prompt;
  zle redisplay
}
zle -N fzf_history
bindkey '^R' fzf_history

# zsh prompt
eval "$(starship init zsh)"


####################################################
# envs
####################################################

# alacritty
source ~/Userland/terminals/alacritty.bash

# pip
export PATH="$PATH:$HOME/.local/bin"

# rust
. "$HOME/.cargo/env"

# golang
export GOPATH="$HOME/go"
export PATH="$PATH:$GOPATH/bin"
export PATH="$PATH:/usr/local/go/bin"

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
echo 'pyenv shell 3.12.3'

# eza - ls color
# eza_params=('--git' '--icons' '--classify' '--group-directories-first' '--time-style=long-iso' '--group' '--color-scale')
# alias ls='eza $eza_params'
# alias sl='ls'
# alias l='eza --git-ignore $eza_params'
# alias ll='eza --all --header --long $eza_params'
# alias llm='eza --all --header --long --sort=modified $eza_params'
# alias la='eza -lbhHigUmuSa'
# alias lx='eza -lbhHigUmuSa@'
# alias lt='eza --tree $eza_params'
# alias tree='eza --tree $eza_params'
source ~/Userland/terminals/ls_colors.sh


####################################################
# my settings
####################################################

# cd, ls
alias cat="batcat -n"
alias ls="ls --color"
alias sl="ls"
alias ll="ls -la"
alias c="clear"
alias cls="clear;ls"

alias b="cd ../"
alias bb="cd ../../"
alias bbb="cd ../../../"
alias bbbb="cd ../../../../"

alias p="cd ~/prog"
alias compe="cd ~/prog/competitives"

alias m="make"
alias mkae="make"
alias amke="make"
alias t="touch"

alias v="nvim"
alias nv="nvim"
alias vn="nvim"

# app
alias tmp="temper"
alias cursor="~/Userland/editors/cursor-0.33.1x86_64.AppImage"
alias pyinit="python -m venv venv && . ./venv/bin/activate && pip install -U pip"

# git
alias ga="git add"
alias gc="git commit"
alias gcm="git commit -m"
alias gb="git branch"

alias gda="git diff --cached"
alias gdh="git diff HEAD"
alias gg="git log --graph --pretty=format:'%x09%C(auto) %h %Cgreen %ar %Creset%x09by\"%C(cyan ul)%an%Creset\" %x09%C(auto)%s %d'"
alias ggh="gg | head"
alias ggl="git log --oneline"
alias gs="git status -uall"
alias gsi="git status --ignored"
alias gp="git push"
alias gpm="git push origin main"
alias gap="git add -p"


# shortcut
alias pbcopy="xclip -selection clipboard"
function copy() { cat $1 | pbcopy }

function mkcd () { mkdir $1 && cd $1 }
function gi() { curl -sLw "\n" https://www.toptal.com/developers/gitignore/api/$@ ;}
function yuki() { mkdir $1 && cd $1 && oj d "https://yukicoder.me/problems/no/$1" }

# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"
