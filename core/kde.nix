{ pkgs, config, ... }:

{
  services.xserver = {
    enable = true;
    displayManager.gdm.enable = true;
    displayManager.defaultSession = "plasmawayland";
    desktopManager.plasma5.enable = true;
  };

  # Open KDE Connect ports
  networking.firewall = {
    allowedTCPPorts = [ 1716 ];
    allowedUDPPorts = [ 1716 ];
  };

  environment.systemPackages = (with pkgs.libsForQt5; [
    kate # Text editor
    kdeconnect-kde
    kcalc
    filelight # Disk usage statistics
    kcharselect # Chatacter select
    kget # Download manager
    akregator # RSS reader
    konversation # IRC client
    neochat # Matrix client
  ]) ++ (with pkgs; [ partition-manager ]);
}
