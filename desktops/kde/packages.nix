{ pkgs, config, home-manager, ... }:

{
  # environment.plasma5.excludePackages = with pkgs.libsForQt5; [];

  home-manager.users.matty.home.packages = (with pkgs.libsForQt5; [
    kate # Text editor
    kdeconnect-kde
    kcalc
    filelight # Disk usage statistics
    kcharselect # Chatacter select
    kget # Download manager
    akregator # RSS reader
    konversation # IRC client
    neochat # Matrix client
  ]) ++ (with pkgs; [
    partition-manager
  ]);

  # Open KDE Connect ports
  networking.firewall.allowedTCPPorts = [ 1716 ];
  networking.firewall.allowedUDPPorts = [ 1716 ];
}
