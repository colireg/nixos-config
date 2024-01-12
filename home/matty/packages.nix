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
    ventoy
    sqlite
    jujutsu
    nixpkgs-fmt # Nix code formatter
    irssi # IRS client
    jcal

    # Langs
    nodejs_21
    gcc
    deno
    clisp
    poetry
    yarn-berry
    python311
    dotnet-sdk_8
    jdk17
    bun
    ghc
    rustup
  ]);
}
