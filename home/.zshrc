export DOTFILES_HOME="$(dirname $(dirname $(readlink ~/.zshrc)))"

cat /etc/os-release \
| cowthink -f ~/.scripts/blank.cow -n \
| lolcat || cat /etc/os-release
~/.scripts/glace

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source $HOME/antigen.zsh
#antigen bundle ssh-agent
antigen theme romkatv/powerlevel10k
antigen bundle ohmyzsh/ohmyzsh lib/
antigen bundle ohmyzsh/ohmyzsh plugins/rbenv/
antigen bundle desyncr/auto-ls
antigen bundle lukechilds/zsh-nvm
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting
antigen apply

#zstyle ':completion:*' matcher-list 'm:{a-zA-Z-_}={A-Za-z_-}' 'r:|=*' 'l:|=* r:|=*'
bindkey -v
bindkey '^R' history-incremental-search-backward


export GOPATH=~/go-extra/lib
export PATH=~/.config/guix/current/bin:$PATH:$GOPATH/bin:~/.local/bin:~/.scripts-local:~/.scripts
export GOPATH=$GOPATH:~/go-extra/code

export EDITOR=vim
alias less=$PAGER
alias run-wine='WINEPREFIX=$PWD/.wine wine'
alias run-wine32='WINEARCH=win32 WINEPREFIX=$PWD/.wine32 wine'

AUTO_LS_COMMANDS=(ls)
#export HISTFILE=$HOME/.zsh_history
#export SAVEHIST=200

setopt share_history
autoload -Uz compinit
compinit

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
if [[ "$TERM" == "linux"* ]]; then
  [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
else
  [[ ! -f ~/.p10k.glyph.zsh ]] || source ~/.p10k.glyph.zsh
fi
