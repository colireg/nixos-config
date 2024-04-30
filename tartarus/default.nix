{ ... }:

{
  imports = [
    ./boot.nix
    ./hardware-configuration.nix
    ./networking.nix
    ./users.nix
    ./packages.nix

    ../modules/core/virtualization.nix
    ../modules/core/zfs.nix
    ../modules/core/console.nix
    ../modules/core/fonts.nix
    ../modules/core/git.nix
    ../modules/core/gnome
    ../modules/core/gnupg.nix
    ../modules/core/syncthing.nix
    ../modules/core/tmux.nix
    ../modules/core/tor.nix
    ../modules/core/nvim.nix
    ../modules/core/xdg.nix
    ../modules/core/zsh.nix
  ];

  services.xserver.enable = true;
  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.config.permittedInsecurePackages = [ "electron-25.9.0" ];
  time.timeZone = "Asia/Tehran";
  i18n.defaultLocale = "en_US.UTF-8";
  sound.enable = true;
  hardware.pulseaudio.enable = true;
  zramSwap.enable = true;
  system.stateVersion = "23.11";
}
