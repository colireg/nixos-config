{ config, ... }:

{
  boot.zfs.requestEncryptionCredentials = false;
  boot.zfs.forceImportRoot = false;
  boot.kernelPackages = config.boot.zfs.package.latestCompatibleLinuxPackages;
  boot.supportedFilesystems = [ "zfs" ];
  networking.hostId = "00000000";
  services.zfs.autoScrub.enable = true;
}
