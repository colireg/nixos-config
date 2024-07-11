{ pkgs, ... }:

{
  home.packages = (with pkgs; [
    # Gui
    firefox
    vlc
    anki
    qbittorrent
    libreoffice
    gimp
    discord
    telegram-desktop
    chromium
    tor-browser-bundle-bin
    obsidian
    imhex
    zed-editor

    # Tools
    hunspell # Spell check for LibreOffice
  ]);
}
