{
  pkgs,
  pkgs-unstable,
  lib,
  username,
  ...
}:

lib.mkMerge [
  {
    # Tmux
    programs.tmux = {
      enable = true;
      clock24 = true;
      extraConfig = ''
        set -g mouse on
        set-window-option -g mode-keys vi
        bind-key -T copy-mode-vi v send -X begin-selection
        bind-key -T copy-mode-vi V send -X select-line
        bind-key -T copy-mode-vi y send -X copy-pipe-and-cancel 'xclip -in -selection clipboard'
        bind-key C-n command-prompt -p "New session:" "new-session -s '%%'"
      '';
    };
    environment.systemPackages = [ pkgs.xclip ];
  }
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
    # Neovim
    programs.neovim = {
      enable = true;
      defaultEditor = true;
      configure.customRC = ''
        set nowrap
        set number
        set relativenumber
      '';
    };
  }
  {
    # Shell
    programs.zsh.enable = true;
    environment.shells = [ pkgs.zsh ];
    users.defaultUserShell = pkgs.zsh;

    # Get completion for system packages for zsh
    environment.pathsToLink = [ "/share/zsh" ];

    environment.systemPackages = with pkgs; [
      nix-index
      fzf
    ];

    programs.command-not-found.enable = false;
    programs.zsh.interactiveShellInit = ''
      source ${pkgs.nix-index}/etc/profile.d/command-not-found.sh
    '';
  }

  {
    # Syncthing
    services.syncthing = {
      enable = true;
      user = username;
      dataDir = "/home/${username}/Public";
    };
    networking.firewall.allowedTCPPorts = [ 22000 ];
    networking.firewall.allowedUDPPorts = [
      22000
      21027
    ];
  }
  {
    # Display
    services.displayManager.defaultSession = "gnome";
    services.xserver = {
      enable = true;
      desktopManager.gnome.enable = true;
      displayManager.gdm.enable = true;
      displayManager.gdm.wayland = true;
    };
    environment.systemPackages = (
      with pkgs;
      [
        foliate # EPUB reader
        gnome-epub-thumbnailer # EPUB thumbnailer for Nautilous
        gnome-tweaks
        gucharmap # Character map
        gnome-solanum # Pomodoro timer
        newsflash # RSS reader
      ]
    );
    environment.sessionVariables = {
      NIXOS_OZONE_WL = "1"; # VSCode wayland
      MOZ_ENABLE_WAYLAND = "1"; # Firefox wayland
      ELECTRON_OZONE_PLATFORM_HINT = "auto";
    };
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
    programs.git = {
      enable = true;
      lfs.enable = true;
    };
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
      vlc
      libreoffice
      gimp
      telegram-desktop
      chromium
      tor-browser-bundle-bin
      obsidian
      imhex
      anki
      firefox
      remmina
      # Tools
      hunspell # Spell check for LibreOffice
      evince
      mpv
      papirus-icon-theme
      vscode-fhs
      qbittorrent
      emacs-gtk
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
