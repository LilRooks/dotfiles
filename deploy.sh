checkFor() {
    echo "Checking to see if $1 is installed"
    if ! [ -x "$(command -v $1)" ]; then
        echo "$1 is not installed."
        exit 1
    else
        echo "$1 is installed."
    fi
}

checkShell() {
    if [ -z "${SHELL##*zsh*}" ] ;then
            echo "Default shell is zsh."
    else
        echo "Default shell is not zsh. Do chsh -s \$(which zsh)."
        exit 1
    fi
}

cpConf() {
    mv -v ~/.$1 ~/.$1.old
    ln -sv "$PWD/.$1" ~/.$1
}

lnOMZmod() {
    ln -sv "$PWD/zsh/$1" ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/$1
}

echo "Does the following:"
echo "1. Check to make sure there's zsh, vim, and tmux installed"
echo "2. Check to see if default shell is zsh"
echo "3. Install zsh mods"
echo "4. Synchronizes other dotfiles"
echo

# 1. Check to make sure there's zsh, vim, and tmux installed
checkFor zsh
checkFor vim
checkFor tmux
echo

# 2. Check to see if default shell is zsh
checkShell
echo

# 3. Install zsh mods
curl -L git.io/antigen > $HOME/antigen.zsh
#sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -qO -)"
#rm ~/.zshrc
#echo

# 4. Synchronizes other dotfiles
git clone https://github.com/gmarik/Vundle.vim ~/.vim/bundle/Vundle.vim

mkdir ~/.config
mkdir ~/.ssh

ln -sv $PWD/home/.* ~/
ln -sv $PWD/home/.config/* ~/.config/
ln -sv $PWD/home/.ssh/* ~/.ssh/
ln -sv $PWD/home/.oh-my-zsh/* ~/.oh-my-zsh/
#rsync -aPubz home/ ~/

vim +PluginInstall +qall
