# For a lack of a better name, doing small stuff for various programs.

# Enable git autocompletion for bash. (Tested on OSX only, most linuxes I use do this by default.)
if [ -f /usr/local/git/contrib/completion/git-completion.bash ]; then
    . /usr/local/git/contrib/completion/git-completion.bash
fi

# Make the python interactive console a bit smarter.
if [ -f ~/.pythonrc.py ]; then
    export PYTHONSTARTUP=~/.pythonrc.py
fi

# On many computers I am required to install things locally.
if [ -d ~/inst ]; then
    export PATH=~/inst/bin:$PATH
    export LD_LIBRARY_PATH=~/inst/lib64:~/inst/lib:$LD_LIBRARY_PATH
    export PYTHONPATH=~/inst/lib/python2.7/site-packages:$PYTHONPATH
fi
