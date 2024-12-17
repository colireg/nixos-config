{
  pkgs,
  lib,
  username,
  ...
}:
{
  imports = [
    ./hardware-configuration.nix
    ../core/virtualization.nix
    ../core/bluetooth.nix
    ../core/fonts.nix
    ../core/git.nix
    ../core/gnome.nix
    ../core/syncthing.nix
    ../core/tmux.nix
    ../core/tor.nix
    ../core/nvim.nix
    ../core/zsh.nix
    {
      # Boot
      boot.supportedFilesystems = [ "ntfs" ];
      boot.loader.systemd-boot.enable = true;
      boot.loader.efi.canTouchEfiVariables = true;
    }
    {
      # ZFS
      boot.supportedFilesystems = [ "zfs" ];
      boot.zfs.allowHibernation = true;
      boot.zfs.forceImportRoot = false;
      networking.hostId = "a0739256";
      services.zfs.autoScrub.enable = true;
    }
    {
      # Network
      networking.hostName = "hades";
      networking.nftables.enable = true;
      networking.wireless.iwd.enable = true;
      networking.networkmanager.enable = true;
      networking.networkmanager.wifi.backend = "iwd";
      networking.firewall.allowPing = true;
      users.users.${username}.extraGroups = [ "networkmanager" ];
    }
    {
      # Packages
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
        jcal
        lsof
        restic
        socat
        mitmproxy
        tealdeer

        elixir
        elixir-ls
        erlang
        erlang-ls
        nixfmt-rfc-style
        nixd
      ];
      programs.htop.enable = true;
      programs.gnupg.agent.enable = true;
      security.pki.certificateFiles = [ /cert/mitmproxy-ca-cert.pem ];
    }
    {
      # Users
      users.users.${username} = {
        isNormalUser = true;
        extraGroups = [
          "wheel"
          "libvirtd"
          "docker"
          "tor"
          "incus-admin"
        ];
      };
      nix.settings.trusted-users = [ "matty" ];
    }
    {
      # Nix
      nixpkgs.config.allowUnfree = true;
      nix.settings.experimental-features = [
        "nix-command"
        "flakes"
      ];
      programs.nix-ld.enable = true;
    }
    {
      # Misc
      services.pcscd.enable = true;
      console.earlySetup = true;
      time.timeZone = "Asia/Tehran";
      i18n.defaultLocale = "en_US.UTF-8";
      zramSwap.enable = true;
      system.stateVersion = "24.11";
    }
  ];
}
