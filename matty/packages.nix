{ pkgs, ... }:

{
  home.packages = (with pkgs; [
    # Gui
    firefox
    vlc
    anki
    vscode-fhs
    qbittorrent
    libreoffice
    gimp
    discord
    telegram-desktop
    chromium
    tor-browser-bundle-bin
    obsidian

    # Tools
    hunspell # Spell check for LibreOffice
    nixpkgs-fmt # Nix code formatter
    jcal
    distrobuilder

    nodejs
  ]);
}
