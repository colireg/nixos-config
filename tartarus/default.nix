{ ... }:

{
  imports = [
    ./boot.nix
    ./hardware-configuration.nix
    ./networking.nix
    ./users.nix
    ./packages.nix

    #../core/postgresql.nix
    ../core/virtualization.nix
    ../core/emacs.nix
    #../modules/core/samba.nix
    ../core/bluetooth.nix
    ../core/audio.nix
    ../core/zfs.nix
    ../core/console.nix
    ../core/fonts.nix
    ../core/git.nix
    #../core/gnome
    ../core/i3.nix
    ../core/gnupg.nix
    ../core/syncthing.nix
    ../core/tmux.nix
    ../core/tor.nix
    ../core/nvim.nix
    ../core/xdg.nix
    ../core/zsh.nix
  ];

  services.xserver.enable = true;
  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.config.permittedInsecurePackages = [ "electron-25.9.0" ];
  time.timeZone = "Asia/Tehran";
  i18n.defaultLocale = "en_US.UTF-8";
  sound.enable = true;
  zramSwap.enable = true;
  system.stateVersion = "24.11";
}
