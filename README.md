# dotfiles
This repository contains my working environment, which primarily consists of:
  * Bash
  * tmux
  * Vim
  * iTerm2, when on mac
  * Emacs, in evil mode

# Setup
The actual dotfiles are symlinks to the files in this repository and are
installed using the install.sh script.

Any bash configurations that are specific to one computer are placed in
~/.bash_local and not checked into this repository.

  1. Clone this repository into ~/dotfiles
  2. Run the install script: `~/dotfiles/install.sh`
  3. Old dotfiles will be backed up in ~/.dotfiles_backup
  4. The following are now symlinks:
   * .bashrc
   * .bash_profile
   * .bash_functions
   * .bash_aliases
   * .emacs.d/
   * .tmux.conf
   * .vim/
   * .tmux/
   * .iterm/

### A note about the .tmux directory
tmux plugins are pulled from git and stored in ~/.tmux/ such that they are not
checked into this repository.
The .tmux/ directory here is empty except for the .gitignore to keep it that way

When tmux starts, plugins are downloaded and installed if they are not already
there. This is done via tmux itself at the very bottom of tmux.conf

### A note about the .emacs.d directory
Packages are currently not checked in, and directories such as .emacs.d/elpa
are for now ignored from git.

### A note about iTerm2
On my macOS machines, iTerm2 is configured to read and save settings to the
~/.iterm/ directory, which is a symlink like the other dotfiles. After making
any changes, iTerm should prompt to save the new settings, which can then be
checked in.
