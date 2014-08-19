#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables

dir=~/dotfiles                    # dotfiles directory

dotfiles="bashrc bash_aliases vimrc tmux.conf todo_completion bash_profile"    # list of filesto symlink in homedir
regfiles="todo_completion todo.sh todo.cfg"    # list of filesto symlink in homedir
dotdirs="vim todo.actions.d"    # list of folders to symlink in homedir

##########

# change to the dotfiles directory
cd $dir

#Create symlinks from the homedir to any files in the ~/dotfiles directory specified in $files
for file in $dotfiles; do
    ln -s $dir/$file ~/.$file 2>/dev/null
done
for file in $regfiles; do
    ln -s $dir/$file ~/$file 2>/dev/null
done
for folder in $dotdirs; do
    rm -rf ~/.$folder 2>/dev/null
    ln -s $dir/$folder ~/.$folder 2>/dev/null
done
echo "done"
