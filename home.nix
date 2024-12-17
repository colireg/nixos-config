{
  pkgs,
  pkgs-unstable,
  lib,
  ...
}:

lib.mkMerge [
  {
    # Packages
    home.packages = with pkgs; [
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
    ];
    programs.vscode = {
      enable = true;
      package = pkgs.vscode-fhs;
    };
  }
  {
    # Unstable packages
    home.packages = with pkgs-unstable; [
      zed-editor
      qbittorrent
    ];
  }
  {
    # Bluetooth
    services.mpris-proxy.enable = true;
  }
  {
    # Misc
    home.username = "matty";
    home.homeDirectory = "/home/matty";
    home.stateVersion = "24.11";
    programs.home-manager.enable = true;
  }
]
