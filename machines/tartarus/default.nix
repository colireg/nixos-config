{
  imports = [
    ./boot.nix
    ./hardware-configuration.nix
    ./networking.nix
    ./packages.nix
    #./nvidia.nix #the package is broken
    ./upower.nix
    ./users.nix
    ./virtualization.nix
    ./xserver.nix
    ./zfs.nix
  ];

  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.permittedInsecurePackages = [ "electron-25.9.0" ];
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  time.timeZone = "Asia/Tehran";
  i18n.defaultLocale = "en_US.UTF-8";
  sound.enable = true;
  hardware.pulseaudio.enable = true;
  zramSwap.enable = true;
  system.stateVersion = "23.11";
}

