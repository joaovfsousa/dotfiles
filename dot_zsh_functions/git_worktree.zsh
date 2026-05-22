function wt {
    export GWT_NEW_DIR_FILE=~/.gwt/newdir

    gwtree "$@"

    if [ -f $GWT_NEW_DIR_FILE ]; then
      builtin cd "$(cat $GWT_NEW_DIR_FILE)"
      rm -f $GWT_NEW_DIR_FILE > /dev/null
    fi
}
