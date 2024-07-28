{ pkgs, config, ... }:

{
  imports = [ ./dconf.nix ./packages.nix ];

  services.xserver = {
    enable = true;
    desktopManager.gnome.enable = true;
    displayManager.gdm.enable = true;
  };
}
