# dotfiles

**NOTE: The setup will only run correctly if run from inside the repository dir. Use [this script](https://github.com/Kruhlmann/dotfiles/blob/master/lib/.scripts/update_dotfiles) to run it from anywhere**

![demo](demo.png)

## Setup

*These dotfiles used to support i3 and dwm, but are now being used with xmonad. They may still prove useful for an these other WMs, but these files are not being maintained!*

To import these dotfiles run the following commands:

```sh
git clone https://github.com/Kruhlmann/dotfiles
cd dotfiles
# Only necessary first time
sudo pacman -S yay
yay -S - < dependencies
#
chmod +x setup
./setup
```

Backups of included files are stored in the [back](back) folder corresponding
to their path from `$HOME` (`~/.config/nvim/init.vim` is saved under
`./back/.config/nvim/init.vim`).

## Scripts

A large array of scripts are available post import:

### `bain`

Battery indicator wallpaper. Supports arch, debian and manjaro logo.

### `cbp`

Uses xdotool to send the content of the clipboard to a window. Useful for wine configurations/virtual machines where clipboard is not shared.

### `colortest`

Prints a pre-set array of colors to the console.

### `.estlintrc.js`

Default ESLint configuration.

### `fzmp`

Fuzzy finder for MPD.

### `i3blocks`

i3blocks script collection. Deprecated in favor of polybar.

### `launch_polybar`

Re-launches polybar with new configuration on all monitors.

### `maimpick`

Shortcut for a variety of maim options. Presented through dmenu.

### `mount_drive`

Interface for mounting external drives.

### `mute_mic`

Mutes the microphone. Useful for applications that do not support push-to-talk natively.

### `prompt`

Uses dmenu to prompt the user for a yes/no answer.

### `qndl`

Queues and downloads a URL using youtube-dl.

### `queueandnotify`

Podboat replacement. Queues downloads from newsboat using taskspooler.

### `qute-bitwarden`

Biwarden userscript for qutebrowser. Run by loggin in to bitwarden-cli with `bw login` and exporting the session. Then use it in qutebrowser with \<Ctrl\>+\<Shift\>+p by default.

### `qute-goyo`

Reading mode for qutebrowser. Triggered by \<Space\>+z.

### `rss_add`

Adds an RSS feed to newsboat.

### `rss_update`

Updates newsboat RSS feeds.

### `run_scaled`

Run an application scaled by a factor.

### `synccal`

Synchronizes calendar from calcurse to a private git repository.

### `sync_music`

Uses youtube-dl to download audio files in playlists specified in `lib/.config/sync_music.conf`.

### `transadd`

Adds a torrent to the transmission-daemon.

### `umount_drive`

Interface for unmounting external drives.

### `unmute_mic`

Mutes the microphone. Useful for applications that do not support push-to-talk natively.

### `unread_mail`

Outputs the number of unread items from neomutt.

### `update_dotfiles`

Updates the dotfiles repo and establishes new symlinks.

### `wifi`

Shortcut for connecting to a wifi network.

### `xprop-i3`

Runs xprop but outputs to an i3 friendly format.
