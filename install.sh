#!/bin/bash
#
# Henri Devieux
# This script will set up dotfile symlinks in home directory

DOTFILES_DIR=~/dotfiles
BACKUP_DIR=~/.dotfiles_backup
MANAGED_FILES="bashrc bash_functions bash_profile bash_aliases vimrc vim"

# create dotfiles_old in homedir
echo "Creating backup dir: $BACKUP_DIR"
echo ""
mkdir -p $BACKUP_DIR

for file in $MANAGED_FILES
do
    printf "Backing up $file in $BACKUP_DIR..."
    mv ~/.$file $BACKUP_DIR/ 2> /dev/null
    echo " DONE"
done

for file in $MANAGED_FILES
do
    printf "Installing symlink to $file..."
    ln -s ~/dotfiles/$file ~/.$file
    echo " DONE"
done
