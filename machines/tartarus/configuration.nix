{ config, pkgs, inputs, ... }:

{
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.zfs.requestEncryptionCredentials = true;
  boot.supportedFilesystems = [ "ntfs" "zfs" ];

  boot.initrd.luks.devices."root" = {
    device = "/dev/disk/by-uuid/69c816c3-4f21-4504-b0dc-ed59009cc777";
    preLVM = true;
    allowDiscards = true;
  };

  boot.initrd.secrets."homekey" = "/homekey";

  boot.initrd.luks.devices."hhd" = { 
   device = "/dev/disk/by-uuid/07ff2e4f-cf11-4a80-adcd-6318b707bcdd"; 
   keyFile = "homekey";
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

  system.stateVersion = "23.05"; 
}

