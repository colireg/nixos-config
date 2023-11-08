{ config, pkgs, inputs, ... }:

{
  home.username = "matty";
  home.homeDirectory = "/home/matty";
  
  home.sessionVariables = {
    NIXOS_OZONE_WL = "1"; # VSCode under wayland 
    MOZ_ENABLE_WAYLAND = "1"; # Firefox wayland
    DISABLE_QT5_COMPAT = "1"; # Anki
  };
  
  home.packages = (with pkgs; [
    firefox
    vlc
    anki
    vscode-fhs
    qbittorrent
    libreoffice
    hunspell # Spell check for LibreOffice
    nodejs
    dotnet-sdk_7
    python311
    gcc
    jcal # Calendar
    gimp
    discord
    telegram-desktop
    openssh
    deno
    clisp
    poetry
    chromium
    yarn
    ventoy
    jetbrains.rider
    tor-browser-bundle-bin
    virt-manager
  ]) ++ (with inputs.unstable.legacyPackages.x86_64-linux; [
    jujutsu
    #obsidian
  ]);


  programs.git = {
    enable = true;
    userName = "matty";
    userEmail = "mattyraud@gmail.com";
  };

  programs.vim = {
    enable = true;
    plugins = with pkgs.vimPlugins; [ vim-polyglot vim-nix ];
    extraConfig = ''
      nnoremap <Up> <Nop>
      nnoremap <Down> <Nop>
      nnoremap <Left> <Nop>
      nnoremap <Right> <Nop>
      set mouse=""
    '';
    settings.number = true;
    settings.relativenumber = true;
  };

  programs.zsh = { 
    enable = true;
    initExtra = ''
      zstyle ':completion:*' menu select
      zstyle ':completion::complete:*' gain-privileges 1
      prompt redhat
      bindkey -v
    '';
  };
  
  
  gtk = {
    enable = true;
    gtk3.extraConfig.Settings = "gtk-application-prefer-dark-theme=1";
    gtk4.extraConfig.Settings = "gtk-application-prefer-dark-theme=1";
  };
  gtk.iconTheme = {
    name = "ePapirus-Dark";
    package = pkgs.papirus-icon-theme;
  };

  home.stateVersion = "23.05";
  programs.home-manager.enable = true;
}
