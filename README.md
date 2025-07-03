Dotfiles managed using GNU Stow

### Setup

Use stow to symlink *package* to `$HOME` directory

```
stow --target=$HOME <package>
```

Example :

```
stow --target=$HOME bash
```
