{ pkgx, config, ... }:

{
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.plasma5.enable = true;
  services.xserver.displayManager.defaultSession = "plasmawayland";

  #environment.plasma5.excludePackages = with pkgs.libsForQt5; [];

  # Open KDE Connect ports
  networking.firewall.allowedTCPPorts = [ 1716 ];
  networking.firewall.allowedUDPPorts = [ 1716 ];
}
