#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables

dir=~/dotfiles                    # dotfiles directory

dotfiles="bashrc bash_aliases tmux.conf tmux_completion bash_profile tmux_git.sh"    # list of filesto symlink in homedir

##########

#Dependencies
if ! hash tmux-next 2>/dev/null; then
    echo "Upgrading tmux to latest version"
    sudo add-apt-repository -yu ppa:pi-rho/dev
    sudo apt-get update
    sudo apt-get install tmux-next
fi

if ! hash pip3 2>/dev/null; then
    sudo apt-get install python3-pip >/dev/null
fi

if ! hash nvim 2>/dev/null; then
    echo "Installing NeoVim"
    sudo add-apt-repository ppa:neovim-ppa/stable >/dev/null &&
    sudo apt-get update >/dev/null &&
    sudo apt-get install neovim >/dev/null &&

    #Install python and ruby bindings for neovim
    pip3 install neovim >/dev/null
    sudo gem install neovim >/dev/null
fi


# change to the dotfiles directory
cd $dir

#Create symlinks from the homedir to any files in the ~/dotfiles directory specified in $files
for file in $dotfiles; do
    rm ~/.$file 2>/dev/null
    ln -s $dir/$file ~/.$file 2>/dev/null
done

rm -rf ~/.vim 2>/dev/null
ln -s $dir/vim ~/.vim

# Add neovim config
mkdir -p ~/.config/nvim
rm ~/.config/nvim/init.vim 2>/dev/null
ln -s $dir/init.vim ~/.config/nvim/


#Install VimPlug
if ! [ -f ~/.local/share/nvim/site/autoload/plug.vim ]; then
    echo "Installing VimPlug"
    curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

nvim +PlugInstall +qall

echo "done"
