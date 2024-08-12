{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix

    #../core/postgresql.nix
    ../core/virtualization.nix
    ../core/emacs.nix
    #../modules/core/samba.nix
    ../core/bluetooth.nix
    ../core/audio.nix
    #../core/zfs.nix
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

  boot.supportedFilesystems = [ "ntfs" "zfs" ];
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = config.boot.zfs.package.latestCompatibleLinuxPackages;

  programs.nix-ld.enable = true;



  networking.hostName = "hades";
  networking.nftables.enable = true;
  networking.wireless.iwd.enable = true;
  networking.networkmanager.enable = true;
  networking.networkmanager.wifi.backend = "iwd";
  networking.firewall.allowPing = true;
  networking.hostId = "a0739256";

  environment.systemPackages = with pkgs; [
    wget
    openssh
    zip
    unzip
    parted
    bat # cat
    ripgrep
    ncdu # disk usage
    duf
    jq
    nnn
    jcal
    lsof
    restic
    lua5_4
    socat

    nixfmt
    nixd
    statix
    vulnix
  ];
  programs.htop.enable = true;
  programs.fzf.fuzzyCompletion = true;
  programs.fzf.keybindings = true;

  users.users.matty = {
    isNormalUser = true;
    extraGroups =
      [ "networkmanager" "wheel" "libvirtd" "docker" "tor" "incus-admin" ];
  };
  nix.settings.trusted-users = [ "matty" ];

  services.zfs.autoScrub.enable = true;
  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  time.timeZone = "Asia/Tehran";
  i18n.defaultLocale = "en_US.UTF-8";
  sound.enable = true;
  zramSwap.enable = true;
  system.stateVersion = "24.05";
}
