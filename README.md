# my_vim_setup

## Setup Instructions

These instructions assume you will be running them from a bash shell, whether in Windows or not. Even so, there are differences between Windows and other OSs in the way vim looks for these files.

### Windows

```
cd ~
git clone git@github.com:PhilRunninger/my_vim_setup.git vimfiles
cd vimfiles/bundle
git clone git@github.com:gmarik/Vundle.vim
```

### Unix and Mac

```
cd ~
git clone git@github.com:PhilRunninger/my_vim_setup.git .vim
cd .vim/bundle
git clone git@github.com:gmarik/Vundle.vim
```

### All OSes

The rest of the setup takes place in vim. Ignore the error messages when you first start vim. They will go away after the final setup steps.

```
vim
:BundleInstall
```

That should do it. You can close and reopen vim to see that there are no longer any messages on startup.
