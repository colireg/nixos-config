{ config, lib, pkgs, modulesPath, ... }:

{
  imports = [ (modulesPath + "/installer/scan/not-detected.nix") ];

  boot.initrd.availableKernelModules = [ "xhci_pci" "ehci_pci" "ahci" "usb_storage" "usbhid" "sd_mod" ];
  boot.initrd.kernelModules = [ "dm-snapshot" ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/7047f868-7652-4acc-a3cf-b4552b53c43c";
    fsType = "ext4";
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/B6BB-81F0";
    fsType = "vfat";
  };

#  fileSystems."/home" = {
#    device = "/dev/disk/by-uuid/9a8ccbe5-46ca-4bc5-86db-b2cadb5c8e28";
#    fsType = "ext4";
#  };

  swapDevices = [{
    device = "/dev/disk/by-uuid/8e24744b-79c7-4acc-9a11-16118b78714a";
  }];

  boot.initrd.secrets."/crypto_keyfile.bin" = "/etc/secrets/initrd/crypto_keyfile.bin";

  boot.initrd.luks.devices."root" = {
    device = "/dev/disk/by-uuid/a8e1b485-436e-4cc5-b7ed-2ea1e53420ba";
    preLVM = true;
    allowDiscards = true;
    #keyFile = "/crypto_keyfile.bin";
  };

#  boot.initrd.luks.devices."home" = {
#   device = "/dev/disk/by-uuid/1d8f5655-0b3f-4278-ba2b-c56faf6adbf7";
#   keyFile = "/crypto_keyfile.bin";
#  };

  networking.useDHCP = lib.mkDefault true;
  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
