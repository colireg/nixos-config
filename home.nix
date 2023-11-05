{ config, pkgs, inputs, ... }:

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

  programs.zsh.enable = true;
  programs.zsh.initExtra = ''
    zstyle ':completion:*' menu select
    zstyle ':completion::complete:*' gain-privileges 1
    prompt redhat
    bindkey -v
  '';
  
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
  ]) ++ (with inputs.unstable.legacyPackages.x86_64-linux; [
    yarn-berry
    jujutsu
    #obsidian
  ]);

  home.stateVersion = "23.05";
  programs.home-manager.enable = true;
}
