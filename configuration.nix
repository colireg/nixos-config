{
  pkgs,
  pkgs-unstable,
  lib,
  username,
  ...
}:

lib.mkMerge [
  {
    # Tor
    services.tor = {
      enable = true;
      client.enable = true;
      torsocks.enable = true;
      settings = {
        ExitNodes = "{DE}";
        ControlPort = 9051;
        DNSPort = 9053;
      };
    };
    users.users.${username}.extraGroups = [ "tor" ];
  }
  {
    # Syncthing
    services.syncthing = {
      enable = true;
      user = username;
      dataDir = "/home/${username}/syncthing";
    };
    networking.firewall.allowedTCPPorts = [ 22000 ];
    networking.firewall.allowedUDPPorts = [
      22000
      21027
    ];
  }
  {
    # Display
    services.xserver = {
      enable = true;
      desktopManager = {
        xterm.enable = false;
        xfce.enable = true;
      };
    };
    services.displayManager.defaultSession = "xfce";
    security.pam.services.gdm.enableGnomeKeyring = true;
    services.gnome.gnome-keyring.enable = true;
    services.libinput.touchpad.naturalScrolling = true;
    environment.systemPackages =
      (with pkgs; [
        arc-theme
        papirus-icon-theme
      ])
      ++ (with pkgs.xfce; [
        xfce4-clipman-plugin
        xfce4-xkb-plugin
        xfwm4-themes
        xfce4-icon-theme
      ]);
  }
  {
    # Font
    fonts = {
      fontconfig = {
        enable = true;
        defaultFonts = {
          monospace = [ "IntelOne Mono" ];
          serif = [ "Noto Serif" ];
          sansSerif = [ "Noto Sans" ];
        };
      };
      packages = with pkgs; [
        intel-one-mono
        fira-code
        fira
        jetbrains-mono
        fira-code-symbols
        nerdfonts
        terminus_font
        terminus_font_ttf
        noto-fonts
        noto-fonts-emoji
        noto-fonts-lgc-plus
        noto-fonts-cjk-sans
        noto-fonts-cjk-serif
        noto-fonts-emoji-blob-bin
        liberation_ttf
      ];
    };
  }
  {
    # Bluetooth
    hardware.bluetooth.enable = true;
    hardware.bluetooth.powerOnBoot = true;
    hardware.bluetooth.settings.General = {
      Enable = "Source,Sink,Media,Socket";
      Experimental = true;
    };
    services.blueman.enable = true;
  }
  {
    # Virtualization
    programs.virt-manager.enable = true;
    virtualisation.libvirtd.enable = true;
    virtualisation.incus.enable = true;
    networking.firewall.trustedInterfaces = [ "incusbr0" ];
    users.users.${username}.extraGroups = [
      "libvirtd"
      "incus-admin"
    ];
    environment.systemPackages = with pkgs; [
      virt-viewer
    ];
  }
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
    # System Packages
    environment.systemPackages = with pkgs; [
      wget
      openssh
      zip
      unzip
      ripgrep
      ncdu # disk usage
      jq
      jcal
      lsof
      tealdeer
      fzf
      xclip # for tmux
      nixfmt-rfc-style
      nixd
      nodejs_20
      gcc
      nvimpager
      trash-cli
      lnch
    ];
    programs.htop.enable = true;
    programs.gnupg.agent.enable = true;
    programs.git = {
      enable = true;
      lfs.enable = true;
    };
    programs.neovim.enable = true;
    programs.adb.enable = true;
    users.users.${username}.extraGroups = [ "adbusers" ];
    programs.tmux.enable = true;
  }
  {
    # Users
    users.users.${username} = {
      isNormalUser = true;
      extraGroups = [
        "wheel"
        "docker"
      ];
    };
    nix.settings.trusted-users = [ username ];
  }
  {
    # Stable user packages
    users.users.${username}.packages = with pkgs; [
      # Gui
      libreoffice
      gimp
      telegram-desktop
      chromium
      tor-browser-bundle-bin
      obsidian
      anki
      firefox
      # Tools
      hunspell # Spell check for LibreOffice
      evince
      mpv
      vscode-fhs
      qbittorrent
      emacs-gtk
      xarchiver
      foliate
      minetest
    ];
  }
  {
    # Unstable user packages
    users.users.${username}.packages = with pkgs-unstable; [
      zed-editor
    ];
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
]
