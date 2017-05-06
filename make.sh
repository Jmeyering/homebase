#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables

homedir=~/
dir=$homedir/dotfiles                    # dotfiles directory

dotfiles="bashrc bash_aliases vimrc tmux.conf todo_completion bash_profile tmux_git.sh"    # list of filesto symlink in homedir
regfiles="todo_completion todo.sh todo.cfg"    # list of filesto symlink in homedir
dotdirs="vim todo.actions.d"    # list of folders to symlink in homedir

##########

# change to the dotfiles directory
cd $dir

#Create symlinks from the homedir to any files in the ~/dotfiles directory specified in $files
for file in $dotfiles; do
    rm ~/.$file 2>/dev/null
    ln -s $dir/$file ~/.$file 2>/dev/null
done
for file in $regfiles; do
    rm ~/$file 2>/dev/null
    ln -s $dir/$file ~/$file 2>/dev/null
done
for folder in $dotdirs; do
    rm -rf ~/.$folder 2>/dev/null
    ln -s $dir/$folder ~/.$folder 2>/dev/null
done

#Install Vundle if not already installed and install plugins
if [ -d $homedir/.vim ] && ! [ -d $homedir/.vim/bundle/Vundle.vim ]; then
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    vim +PluginInstall +qall >/dev/null
fi
echo "done"
