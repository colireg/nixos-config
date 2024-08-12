{ pkgs, pkgs-unstable, ... }:

{
  home.packages = (with pkgs; [
    # Gui
    firefox
    vlc
    anki
    qbittorrent
    libreoffice
    gimp
    telegram-desktop
    chromium
    tor-browser-bundle-bin
    obsidian
    imhex
    logseq
    # Tools
    hunspell # Spell check for LibreOffice
  ]) ++ (with pkgs-unstable; [
    zed-editor
  ]);
}
