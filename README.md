# Vim Configurations

This contains a vim environment setup for backup and portability.

## Setup

### Symlink .vimrc

```shell
ln -sf .vimrc ~/.vimrc
```

Create a link to use this vimrc.

Then run the following in Vim:

```
:source %
:PlugInstall
```

This installs the plugins in plugins.vim using vim-plug.
