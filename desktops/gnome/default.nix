{ config, pkgs, ... }:

{
  services.xserver.desktopManager.gnome.enable = true;
  services.xserver.displayManager.gdm.enable = true;

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

  environment.systemPackages = (with pkgs; [
    papirus-icon-theme
    foliate # EPUB reader
    gnome-epub-thumbnailer # EPUB thumbnailer for Nautilous
    gnome.gnome-tweaks
    gnome.gucharmap # Character map
  ]) ++ (with pkgs.gnomeExtensions; [
    just-perfection
    rounded-window-corners
    unite
  ]);

  # Enable automatic login for the user.
  #services.xserver.displayManager.autoLogin = { enable = true; user = "${config.home.username}"; };

  # Workaround for GNOME autologin: https://github.com/NixOS/nixpkgs/issues/103746#issuecomment-945091229
  #systemd.services = { "getty@tty1".enable = false; "autovt@tty1".enable = false; };

}