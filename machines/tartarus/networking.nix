{
  networking = {
    hostName = "tartarus";
    networkmanager.enable = true;
    #nameservers = [ "178.22.122.100" "185.51.200.2" ];
    firewall.enable = true;
    firewall.allowPing = true;
  };
}
