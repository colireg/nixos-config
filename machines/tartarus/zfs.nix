{ config, ... }:

{
  boot = {
    zfs.requestEncryptionCredentials = true;
    kernelPackages = config.boot.zfs.package.latestCompatibleLinuxPackages;
    supportedFilesystems = [ "zfs" ];
  };
  networking.hostId = "00000000";
  services.zfs.autoScrub.enable = true;
}
