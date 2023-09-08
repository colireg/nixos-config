{ pkgs, config, home-manager, ... }:

{
  # Exclude gnome bloat
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

  home-manager.users.matty.home.packages = (with pkgs; [
    foliate # EPUB reader
    gnome-epub-thumbnailer # EPUB thumbnailer for Nautilous
    gnome.gnome-tweaks
    gnome.gucharmap # Character map
  ]) ++ (with pkgs.gnomeExtensions; [
    just-perfection
    rounded-window-corners
    unite
  ]);
}