{ pkgs, ... }:

{
  programs.virt-manager.enable = true;
  virtualisation.libvirtd.enable = true;
  #virtualisation.docker.enable = true;
  virtualisation.vmware.host.enable = true;
  virtualisation.incus.enable = true;
  networking.firewall.trustedInterfaces = [ "incusbr0" ];
}
