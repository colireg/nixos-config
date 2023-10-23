{ pkgx, config, ... }:

{
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.plasma5.enable = true;
  services.xserver.displayManager.defaultSession = "plasmawayland";
}
