{ username, ... }:

{
  services.syncthing = {
    enable = true;
    user = username;
    dataDir = "/home/${username}/public";
  };
  networking.firewall.allowedTCPPorts = [ 22000 ];
  networking.firewall.allowedUDPPorts = [
    22000
    21027
  ];
}
