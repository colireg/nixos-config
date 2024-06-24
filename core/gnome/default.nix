{ pkgs, config, ... }:

{
  imports = [
    ./dconf.nix
    ./packages.nix
  ];

  services.xserver = {
    desktopManager.gnome.enable = true;
    displayManager.gdm.enable = true;
  };
}
