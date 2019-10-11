# dotfiles

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

After the setup has concluded you can simply edit the files in the repository 
directory as all configuration files are created as symbolic links pointing 
to the files in this folder.
