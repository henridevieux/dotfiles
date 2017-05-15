#!/bin/bash
#
# hdevieux
# this is used to create and manage dotfiles symlinks from home directory
# to dotfiles repository

OS="$(uname -s)"
DOTFILES_DIR="$HOME"/dotfiles
BACKUP_DIR="$HOME"/.dotfiles_backup
MANAGED_FILES="bashrc\
               bash_functions\
               bash_profile\
               bash_aliases\
               emacs.d\
               tmux.conf\
               tmux\
               vimrc\
               vim"

function GIT_CMD() {
    git --git-dir="$DOTFILES_DIR"/.git --work-tree="$DOTFILES_DIR" "$@"
}

# verify things are ready
if [ ! -d "$DOTFILES_DIR" ]; then
    echo "$DOTFILES_DIR not found. Exiting"
    exit 1
fi

GIT_CMD diff-index --quiet HEAD -- \
    && GIT_CMD pull \
    || echo "WARNING: Unstaged changes to dotfiles repo."

if [ -d "$BACKUP_DIR" ]; then
    printf "Overwriting backup dir... "
    rm -rf "$BACKUP_DIR"
    echo "DONE"
fi
mkdir -p "$BACKUP_DIR"

# install links to managed dotfiles, backing up any existing
# ones that might already be installed
for f in $MANAGED_FILES
do
    if [ "$(dirname "$(readlink "$HOME"/."$f")")" == "$DOTFILES_DIR" ]; then
        echo "$f already linked"
    else
        if [ -e "$HOME"/."$f" ]; then
            echo "Backing up $f"
            mv "$HOME"/."$f" "$BACKUP_DIR/"
        fi

        echo "Installing symlink to $f"
        ln -s "$DOTFILES_DIR"/"$f" "$HOME"/."$f"
    fi
done

# Tmux directory for resurrection backups
if [ ! -d "$HOME"/.tmux_resurrection ]; then
    mkdir "$HOME"/.tmux_resurrection
fi

# Configure iTerm2 if on a mac
if [ "$OS" == "Darwin" ]; then
    if [ "$(dirname "$(readlink "$HOME"/.iterm)")" == "$DOTFILES_DIR" ]; then
        echo ".iterm already linked"
    else
        if [ -e "$HOME"/.iterm ]; then
            echo "Backing up .iterm"
            mv "$HOME"/.iterm "$BACKUP_DIR/"
        fi

        ln -s "$DOTFILES_DIR"/iterm "$HOME"/.iterm
        echo "$HOME/.iterm installed. Be sure to configure iTerm2 settings dir"
    fi
fi
