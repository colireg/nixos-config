{
  imports = [
    ./base.nix
    ./boot.nix
    ./hardware-configuration.nix
    ./networking.nix
    #./nvidia.nix
    ./users.nix
    ./virtualization.nix
    ./zfs.nix
    ./packages.nix
  ];
}
