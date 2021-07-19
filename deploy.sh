[[ "$0" != "./deploy.sh" ]] && echo "Please run from dotfiles directory!" && exit 1

checkFor() {
    echo "Checking to see if $1 is installed"
    if ! [ -x "$(command -v $1)" ]; then
        echo "$1 is not installed."
        exit 1
    else
        echo "$1 is installed."
    fi
}

echo "Does the following:"
echo "1. Check to make sure there's zsh, vim, and tmux installed"
echo "2. Install zsh mods"
echo "3. Synchronizes other dotfiles"
echo

# 1. Check to make sure there's zsh, vim, and tmux installed
checkFor zsh
checkFor vim
checkFor tmux
echo

# 2. Install zsh mods
curl -L git.io/antigen > $HOME/antigen.zsh

# 3. Synchronizes other dotfiles
git clone https://github.com/gmarik/Vundle.vim ~/.vim/bundle/Vundle.vim

mkdir ~/.config
mkdir ~/.ssh

mkdir -p ~/.local/share/fonts
cp $PWD/home/.local/share/fonts/* ~/.local/share/fonts

ln -sv $PWD/home/.* ~/
ln -sv $PWD/home/.config/* ~/.config/
ln -sv $PWD/home/.ssh/* ~/.ssh/

vim +PluginInstall +qall
