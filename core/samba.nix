{ config, username, ... }:

{
  services.samba = {
    enable = true;
    securityType = "user";
    openFirewall = true;
    extraConfig = ''
      workgroup = WORKGROUP
      server string = ${config.networking.hostName}
      netbios name = ${config.networking.hostName}
      #use sendfile = yes
      #max protocol = smb2
      # note: localhost is the ipv6 localhost ::1
      hosts allow = 192.168.0. 10.89.136.1/24 localhost
      hosts deny = 0.0.0.0/0
      guest account = nobody
      map to guest = bad user
    '';
  };

  # Make shares visible for Windows 10 clients
  services.samba-wsdd = {
    enable = true;
    openFirewall = true;
  };

  services.samba.shares.public = {
    path = "/home/${username}/public";
    browseable = "yes";
    "read only" = "no";
    "guest ok" = "no";
    "create mask" = "0644";
    "directory mask" = "0755";
    "force user" = username;
    "force group" = "users";
  };
}
