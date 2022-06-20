#!/usr/bin/env sh

pre_install

needs_install() {
  command -v /usr/bin/betterdiscordctl >/dev/null || return 0
  return 1
}

download_mwittrien_plugin() {
  curl -L "https://github.com/mwittrien/BetterDiscordAddons/raw/master/Plugins/$1/$1.plugin.js" \
    -o "$HOME/.config/BetterDiscord/plugins/$1.plugin.js"
}

download_xibread_plugin() {
  curl -L "https://raw.githubusercontent.com/xiBread/bd-contributions/master/$1/$1.plugin.js" \
    -o "$HOME/.config/BetterDiscord/plugins/$1.plugin.js"
}

download_qwertxd_plugin() {
  curl -L "https://raw.githubusercontent.com/QWERTxD/BetterDiscordPlugins/main/$1/$1.plugin.js" \
    -o "$HOME/.config/BetterDiscord/plugins/$1.plugin.js"
}

download_official_plugin() {
  curl -L "https://betterdiscord.app/Download?id=$1" \
    -o "$HOME/.config/BetterDiscord/plugins/$2.plugin.js"
}

setup() {
  depends_on betterdiscordctl-git
  download_mwittrien_plugin BetterNsfwTag
  download_mwittrien_plugin CharCounter
  download_mwittrien_plugin CopyRawMessage
  download_mwittrien_plugin OpenSteamLinksInApp
  download_mwittrien_plugin ReadAllNotificationsButton
  download_mwittrien_plugin ShowHiddenChannels
  download_mwittrien_plugin SplitLargeMessages
  download_mwittrien_plugin StaffTag
  download_mwittrien_plugin Translator
  download_xibread_plugin BetterCodeblocks
  download_qwertxd_plugin TypingUsersAvatars
  download_official_plugin 9 0PluginLibrary
  curl \
    -L https://raw.githubusercontent.com/schnensch0/zelk/main/zelkBD.theme.css \
    -o "$HOME/.config/BetterDiscord/themes/zelkBD.theme.css"
}

postinstall() {
  return
}
