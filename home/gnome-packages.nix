{ pkgs, ... }:
{
  home.packages = (with pkgs; [
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
