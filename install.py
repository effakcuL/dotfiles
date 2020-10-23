import os
from os.path import expanduser as eu, dirname, exists, join as pjoin
from time import time
from subprocess import call

# Compatibility between py2 and py3:
try: input = raw_input
except NameError: pass

# See if we've got Jupyter.
try:
    from notebook.nbextensions import install_nbextension, jupyter_data_dir
    from notebook.services.config import ConfigManager
    jupyter_nb = True
except ImportError:
    jupyter_nb = False

backup = True


def makedirs(dirs):
    # Create the folder in case it doesn't exist.
    try:
        os.makedirs(dirs)
    except OSError as e:
        if e.errno != 17:  # 17 means directory already exists
            raise


def link_with_backup(source, link_name):
    full_link_name = eu(link_name)
    print('Installing ' + source + ' -> ' + full_link_name)

    makedirs(dirname(full_link_name))

    try:
        os.symlink(source, full_link_name)
    except OSError:
        if backup:
            os.rename(full_link_name, full_link_name + '.' + str(int(time())) + '.dotfiles_backup')
        else:
            # Try to remove this thing. Non-empty directories don't work yet.
            try:
                os.remove(full_link_name)
            except OSError as e:
                os.rmdir(full_link_name)
        os.symlink(source, full_link_name)


def here(f):
    import inspect
    me = inspect.getsourcefile(here)
    return pjoin(os.path.dirname(os.path.abspath(me)), f)


def here_to_home(name, toname=None):
    link_with_backup(here('_' + name), '~/.' + (toname if toname else name))

def main():
    # Pull in the plugins
    if call(['git', 'submodule', 'update', '--init']) != 0:
        if input('Error during submodule (=plugin) init or update. Continue setup? [Y/n] ') not in ('y', 'Y', ''):
            return 1

    # Pull in Vundle (for vim, should make it a submodule at some point?)
    global backup
    backup = input('Delete existing files (no backs them up)? [y/N]: ') not in ('y', 'Y')

    here_to_home('bash')
    bashrc = eu('~/.bashrc')
    bashappend = open('_bashrc.append').read()
    try:
        if bashappend not in open(bashrc).read():
            with open(bashrc, 'a') as f:
                f.write(bashappend)
    except IOError:
        # Assume non-existing file. Create one.
        # (Or no permission, this wont change anything in that case.)
        with open(bashrc, 'w+') as f:
            f.write(bashappend)

    here_to_home('vimrc')
    here_to_home('vim')
    here_to_home('tmux.conf')
    here_to_home('ssh_config', 'ssh/config')
    here_to_home('config_nvim', 'config/nvim')

    # Reload some stuff
    print("Don't forget to possibly run the following: ")
    print("- Open vim and run `:PlugInstall`")
    print("- Open vim and run `:CocInstall coc-clangd` (needs npm)")

if __name__ == '__main__':
    main()
