# hdevieux
# .bash_functions
# This file is managed by dotfiles repository
# Last updated: 3/27/2017

git_branch_info() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

_sync_dir () {
    cmd=$1
    shift
    new_directory=$(boxer sync_dir $@)
    if [ "$?" -eq "0" ]; then
        $cmd $new_directory
    else
        echo "$new_directory"
    fi
}

cdsync () {
    _sync_dir cd $@
}

editsync () {
    _sync_dir $EDITOR $@
}

opensync () {
    _sync_dir open @o
}

# Function to rename tmux windows
tmux_rename() {
   if [ -z "$1" ]; then
       printf "\033k$(hostname -s)\033\\"
   else
       printf "\033k$1\033\\"
   fi
}
