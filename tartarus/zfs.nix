{ config, ... }:

{
  boot.zfs.requestEncryptionCredentials = true;
  boot.kernelPackages = config.boot.zfs.package.latestCompatibleLinuxPackages;
  boot.supportedFilesystems = [ "zfs" ];
  networking.hostId = "00000000";
  services.zfs.autoScrub.enable = true;
}
