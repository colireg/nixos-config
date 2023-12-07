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
    jcal # Calendar
    gimp
    discord
    telegram-desktop
    openssh
    chromium
    ventoy
    tor-browser-bundle-bin
    virt-manager
    zip
    # Dev tools
    nodejs_20
    gcc
    deno
    clisp
    poetry
    yarn
    python311
    dotnet-sdk_7
    jdk17
    obsidian
    bun
  ]) ++ (with inputs.unstable.legacyPackages.x86_64-linux; [
    jujutsu
  ]);

  programs.git = {
    enable = true;
    userName = "matty";
    userEmail = "mattyraud@gmail.com";
    lfs.enable = true;
  };
  programs.git.extraConfig = {
    init.defaultBranch = "main";
    core.fileMode = false;
  };

  programs.vim = {
    enable = true;
    plugins = with pkgs.vimPlugins; [ vim-polyglot vim-nix ];
    extraConfig = ''
      noremap <Up> <Nop>
      noremap <Down> <Nop>
      noremap <Left> <Nop>
      noremap <Right> <Nop>
      set mouse=""
      set nowrap
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

  home.stateVersion = "23.11";
  programs.home-manager.enable = true;
}
