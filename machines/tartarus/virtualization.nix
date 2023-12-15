{
  programs.dconf.enable = true;
  virtualisation = {
    libvirtd.enable = true;
    docker.enable = true;
    vmware.host.enable = true;
    incus.enable = true;
  };
}
