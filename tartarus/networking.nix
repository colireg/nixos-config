{ ... }:

{
  networking.hostName = "tartarus";
  networking.networkmanager.enable = true;
  networking.firewall.enable = true;
  networking.firewall.allowPing = true;
  networking.firewall = {
    allowedTCPPorts = [ 8000 ];
    allowedUDPPorts = [ 8000 ];
  };
}
