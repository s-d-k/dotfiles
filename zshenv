# Set `open` tool as default `BROWSER` on OS X.
if [[ "$OSTYPE" == darwin* ]]; then
  export BROWSER='open'
fi

# Ensure locale settings are properly set-up.
if [[ -z "$LANG" ]]; then
  export LANG='en_US.UTF-8'
fi

# unique items only in these
typeset -gU cdpath fpath mailpath path

# /usr/local at front of path
path=( /usr/local/{bin,sbin} $path )
if [ ! -z "$VIRTUAL_ENV" ] ; then
    # add virtual env to front of path when active
    path=( "$VIRTUAL_ENV/bin" $path )
fi

export LESS='-R -F -X -n'

export EDITOR=vim
