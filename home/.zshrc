fortune ~/.scripts/anti-jokes ~/.scripts/ascii-art | cowthink -f ~/.scripts/blank.cow -n | lolcat
~/.scripts/glace

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

[[ -d /data/data/com.termux ]] && ROOT=/data/data/com.termux/files
export WORKON_HOME=~/Envs
source $ROOT/usr/bin/virtualenvwrapper.sh

source $HOME/antigen.zsh
antigen theme romkatv/powerlevel10k
antigen bundle robbyrussell/oh-my-zsh lib/
antigen bundle ssh-agent
antigen bundle desyncr/auto-ls
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting
antigen apply

#zstyle ':completion:*' matcher-list 'm:{a-zA-Z-_}={A-Za-z_-}' 'r:|=*' 'l:|=* r:|=*'
bindkey -v
bindkey '^R' history-incremental-search-backward

export PATH=$PATH:~/.scripts-local:~/.scripts
export EDITOR=vim
AUTO_LS_COMMANDS=(ls)
#export HISTFILE=$HOME/.zsh_history
#export SAVEHIST=200

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
