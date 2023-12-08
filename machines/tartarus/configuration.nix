{ config, pkgs, inputs, ... }:

{
  imports = [ ./hardware-configuration.nix ];
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.zfs.requestEncryptionCredentials = true;
  boot.supportedFilesystems = [ "ntfs" "zfs" ];
  boot.kernelPackages = config.boot.zfs.package.latestCompatibleLinuxPackages;

  boot.initrd.luks.devices."ssd" = {
    device = "/dev/disk/by-uuid/f7af2d08-10a5-4f6f-9f26-0109c6d2cee4";
    preLVM = true;
    allowDiscards = true;
  };

  boot.initrd.secrets."hdd-key" = "/hdd-key";

  boot.initrd.luks.devices."hhd" = { 
   device = "/dev/disk/by-uuid/b7aa92ee-84b2-4efe-a760-5da638f477bc"; 
   keyFile = "hdd-key";
  };

  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.config.permittedInsecurePackages = [ "electron-24.8.6" ];

  networking = {
    hostName = "tartarus";
    hostId = "00000000"; # Required for ZFS
    networkmanager.enable = true; 
    #nameservers = [ "178.22.122.100" "185.51.200.2" ];
    firewall.enable = true;
    firewall.allowPing = true;
  };

  time.timeZone = "Asia/Tehran";
  i18n.defaultLocale = "en_US.UTF-8";

  services.xserver = {
    enable = true;
    videoDrivers = [ "nouveau" ];
    layout = "us"; # Configure keymap in X11
    xkbVariant = "";
    libinput.enable = true; # Enable touchpad support
  };

  users.users.matty = {
    isNormalUser = true;
    description = "Matty";
    extraGroups = [ "networkmanager" "wheel" "libvirtd" "docker" "tor" ];
  };

  nix.settings.trusted-users = [ "matty" ];

  sound.enable = true;
  hardware.pulseaudio.enable = true;
   
  environment.systemPackages = with pkgs; [
    wget
    git
  ];
  
  programs.vim.defaultEditor = true;

  services.zfs.autoScrub.enable = true;

  programs.dconf.enable = true;
  virtualisation.libvirtd.enable = true;
  virtualisation.docker.enable = true;
  virtualisation.vmware.host.enable = true;

  services.upower = {
    enable = true;
    criticalPowerAction = "Hibernate";
    percentageCritical = 6;
    percentageLow = 20;
  };

  system.stateVersion = "23.11"; 
}

