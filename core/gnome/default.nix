{ pkgs, config, ... }:

{
  imports = [ ./dconf.nix ./packages.nix ];

  services.xserver = {
    enabe = true;
    desktopManager.gnome.enable = true;
    displayManager.gdm.enable = true;
  };
}
