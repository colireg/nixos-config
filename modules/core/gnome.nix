{ pkgs, config, ... }:

{
  services.xserver = {
    enable = true;
    desktopManager.gnome.enable = true;
    displayManager.gdm.enable = true;
  };

  environment.gnome.excludePackages = (with pkgs; [
    gnome-tour
  ]) ++ (with pkgs.gnome; [
    cheese # webcam tool
    gnome-music
    gnome-maps
    gnome-characters
    epiphany # web browser
    totem # video player
    tali # poker game
    iagno # go game
    hitori # sudoku game
    atomix # puzzle game
  ]);

  environment.systemPackages = (with pkgs; [
    foliate # EPUB reader
    gnome-epub-thumbnailer # EPUB thumbnailer for Nautilous
    gnome.gnome-tweaks
    gnome.gucharmap # Character map
    gnome-solanum # Pomodoro timer
    newsflash # RSS reader
  ]) ++ (with pkgs.gnomeExtensions; [
    just-perfection
  ]);
}
