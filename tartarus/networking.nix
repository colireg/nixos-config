{ ... }:

{
  networking.hostName = "tartarus";
  networking.nftables.enable = true;
  networking.networkmanager.enable = true;
  networking.firewall.enable = true;
  networking.firewall.allowPing = true;
}
