{ pkgs, pkgs-unstable, ... }:

{
  imports = [
    ../home/nvim
  ];

  home.packages =
    (with pkgs; [
      # Gui
      vlc
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
      mpv
      papirus-icon-theme
      emacs-gtk
    ])
    ++ (with pkgs-unstable; [
      zed-editor
      requestly
      qbittorrent
    ]);

  programs.vscode = {
    enable = true;
    package = pkgs.vscode-fhs;
  };

  # For bluetooth
  services.mpris-proxy.enable = true;
  home.username = "matty";
  home.homeDirectory = "/home/matty";
  home.stateVersion = "24.11";
  programs.home-manager.enable = true;
}
