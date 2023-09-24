{ config, pkgs, ... }:

{
  imports = [
    ./desktops/gnome/dconf.nix
  ];

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
    anki
    vscode-fhs
    qbittorrent
    libreoffice
    hunspell # Spell check for LibreOffice
    obsidian
    nodejs
    dotnet-sdk_7
    python3
    jcal # calendar
    gimp
    discord
    telegram-desktop
    wget
    newsflash
  ];

  home.stateVersion = "23.05";
  programs.home-manager.enable = true;
}
