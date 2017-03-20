#!/bin/bash
#
# Henri Devieux
# This script will set up dotfile symlinks in home directory

DOTFILES_DIR="$HOME"/dotfiles
BACKUP_DIR="$HOME"/.dotfiles_backup
MANAGED_FILES="bashrc\
               bash_functions\
               bash_profile\
               bash_aliases\
               tmux.conf\
               vimrc\
               vim/"

# create dotfiles_old in homedir
echo "Creating backup dir: $BACKUP_DIR"
rm -rf $BACKUPDIR 

echo ""
mkdir -p $BACKUP_DIR

for file in $MANAGED_FILES
do
    printf "Backing up $file in $BACKUP_DIR..."
    mv "$HOME"/.$file $BACKUP_DIR/ 2> /dev/null
    echo " DONE"
done

for file in $MANAGED_FILES
do
    printf "Installing symlink to $file..."
    ln -s "$HOME"/dotfiles/$file "$HOME"/file
    echo " DONE"
done
