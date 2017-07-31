#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables

homedir=~/
dir=$homedir/dotfiles                    # dotfiles directory

dotfiles="bashrc bash_aliases tmux.conf bash_profile tmux_git.sh"    # list of filesto symlink in homedir

##########

#Dependencies
if ! hash pip3 2>/dev/null; then
    sudo apt-get install python3-pip 1>/dev/null
fi

if ! hash nvim 2>/dev/null; then
    echo "Installing NeoVim"
    sudo add-apt-repository ppa:neovim-ppa/stable 1>/dev/null &&
    sudo apt-get update 1>/dev/null &&
    sudo apt-get install neovim 1>/dev/null &&
    pip3 install neovim 1>/dev/null
fi


# change to the dotfiles directory
cd $dir

#Create symlinks from the homedir to any files in the ~/dotfiles directory specified in $files
for file in $dotfiles; do
    rm ~/.$file 2>/dev/null
    ln -s $dir/$file $homedir/.$file 2>/dev/null
done

ln -s $dir/vim $homedir/.vim

# Add neovim config
rm $homedir/.config/nvim/init.vim 2>/dev/null
ln -s $dir/init.vim $homedir/.config/nvim/


#Install VimPlug
if ! [ -d $homedir/.local/share/nvim/site/autoload/plug.vim ]; then
    curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

vim +PlugInstall +qall

echo "done"
