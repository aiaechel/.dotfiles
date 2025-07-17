# .dotfiles
Repo to hold my dotfiles

## Deployment

To deploy these dotfiles, run the `deploy.sh` script:

```bash
./deploy.sh
```

This script uses [GNU Stow](httpss://www.gnu.org/software/stow/) to create symlinks for the dotfiles in your home directory. It will also check for some recommended dependencies and create necessary directories.
