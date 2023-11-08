{ config, ... }:

{
  # Make shares visible for Windows 10 clients
  services.samba-wsdd.enable = true; 
  services.samba = {
    enable = true;
    securityType = "user";
    openFirewall = true;
    extraConfig = ''
      workgroup = WORKGROUP
      #server string = ${config.networking.hostName}
      #netbios name = ${config.networking.hostName}
      #use sendfile = yes
      #max protocol = smb2
      # note: localhost is the ipv6 localhost ::1
      hosts allow = 192.168.0.0/16 localhost
      hosts deny = 0.0.0.0/0
      guest account = nobody
      map to guest = bad user
     '';
   };

  # Open WSSD ports
  networking.firewall.allowedTCPPorts = [ 5357 ];
  networking.firewall.allowedUDPPorts = [ 3702 ];

  # TO-DO: Replace username with a variable
  services.samba.shares.public = {
    path = "/home/matty/public";
    browseable = "yes";
    "read only" = "no";
    public = "yes";
    writable = "yes";
    "guest ok" = "yes";
    "guest only" = "yes";
    "force user" = "matty";
  };
}