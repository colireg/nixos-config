{ ... }:

{
  services.syncthing = {
    enable = true;
    user = "matty";
    dataDir = "/home/matty/public";
  };
  networking.firewall.allowedTCPPorts = [ 22000 ];
  networking.firewall.allowedUDPPorts = [ 22000 21027 ];
}
