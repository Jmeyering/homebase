#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables

dir=~/dotfiles                    # dotfiles directory
olddir=~/old_dotfiles             # old dotfiles backup directory
dotfiles="bashrc bash_aliases vimrc tmux.conf vim todo_completion"    # list of files/folders to symlink in homedir
regfiles="todo_completion todo.sh todo.cfg"    # list of files/folders to symlink in homedir

##########

# create dotfiles_old in homedir
mkdir -p $olddir

# change to the dotfiles directory
cd $dir

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks from the homedir to any files in the ~/dotfiles directory specified in $files
for file in $dotfiles; do
    mv ~/.$file ~/$olddir 2>/dev/null
    ln -s $dir/$file ~/.$file 2>/dev/null
done
for file in $regfiles; do
    ln -s $dir/$file ~/$file 2>/dev/null
done
echo "done"
