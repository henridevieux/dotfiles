#
# Hdevieux .bash_functions 
#

git_branch_info() {
  #   output=$(git branch 2> /dev/null)
  #   if [ $? -ne 0 ]; then
  #       echo ""
  #   else
  #       echo $output | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
  #  fi
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
