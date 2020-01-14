# dotfiles

**NOTE: the setup will only run correctly if run from inside the repository dir. Use [this script](https://github.com/Kruhlmann/dotfiles/blob/master/lib/.scripts/update_dotfiles) to run it from anywhere**

To import these dotfiles run the following commands:

```bash
git clone https://github.com/Kruhlmann/dotfiles
cd dotfiles
chmod +x setup
./setup
```

Backups of included files are stored in the [back](back) folder corresponding
to their path from `$HOME` (`~/.config/nvim/init.vim` is saved under
`./back/.config/nvim/init.vim`).
