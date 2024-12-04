{ ... }:

{
  users.users.matty = {
    isNormalUser = true;
    extraGroups = [
      "networkmanager"
      "wheel"
      "libvirtd"
      "docker"
      "tor"
      "incus-admin"
    ];
  };
  nix.settings.trusted-users = [ "matty" ];
}
