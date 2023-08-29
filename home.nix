{ config, pkgs, ... }:

{
  home.username = "matty";
  home.homeDirectory = "/home/matty";
  
  home.sessionVariables = {
    NIXOS_OZONE_WL = "1"; # VSCode under wayland 
    MOZ_ENABLE_WAYLAND = "1"; # Firefox wayland
    DISABLE_QT5_COMPAT = "1"; # Anki
  };
  
  programs.git = {
    enable = true;
    userName = "matty";
    userEmail = "mattyraud@gmail.com";
  };
  
  home.packages = with pkgs; [
    firefox
    vlc
    papirus-icon-theme
    anki
    tor-browser-bundle-bin
    vscode-fhs
    foliate # EPUB reader
    gnome-epub-thumbnailer # EPUB thumbnailer for Nautilous
    qbittorrent
    virt-manager
    libreoffice
    hunspell # Spell check for LibreOffice
    obsidian
    jetbrains.rider
    dotnet-sdk_7
    gnome.gnome-tweaks
    gnome.gucharmap
    gnomeExtensions.just-perfection
    gnomeExtensions.rounded-window-corners
    gnomeExtensions.unite
  ];



  home.stateVersion = "23.05";
  programs.home-manager.enable = true;
}