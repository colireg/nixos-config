{ pkgs, pkgs-unstable, ... }:

{
  imports = [ ../home/gtk.nix ../home/nvim ../home/vscode ];

  home.packages = (with pkgs; [
    # Gui
    vlc
    qbittorrent
    libreoffice
    gimp
    telegram-desktop
    chromium
    tor-browser-bundle-bin
    obsidian
    imhex
    anki
    firefox
    remmina
    # Tools
    hunspell # Spell check for LibreOffice
    evince
    xarchiver
    mpv
    papirus-icon-theme
  ]) ++ (with pkgs-unstable; [ zed-editor ]);

  # For bluetooth
  services.mpris-proxy.enable = true;
  home.username = "matty";
  home.homeDirectory = "/home/matty";
  home.stateVersion = "24.05";
  programs.home-manager.enable = true;
}
