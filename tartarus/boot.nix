{ ... }:

{
  boot.supportedFilesystems = [ "ntfs" ];
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.initrd.secrets."hdd-key" = "/hdd-key";
  boot.initrd.luks.devices = {
    "ssd-luks" = {
      device = "/dev/disk/by-uuid/f7af2d08-10a5-4f6f-9f26-0109c6d2cee4";
      preLVM = true;
      allowDiscards = true;
    };
    "hhd-luks" = {
      device = "/dev/disk/by-uuid/0d9ab27a-4bf7-407b-abee-9d27be8c3e20";
      keyFile = "hdd-key";
    };
  };
}