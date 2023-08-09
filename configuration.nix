{ config, pkgs, ... }:

{
  imports = [ ./hardware-configuration.nix ];

  # Use the systemd-boot EFI boot loader.
  boot.loader = { systemd-boot.enable = true; efi.canTouchEfiVariables = true; };

  # Enable NTFS
  boot.supportedFilesystems = [ "ntfs" ];

  # Enable flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Setup zswap
  boot.kernelParams = [ "zswap.enabled=1" ];
  boot.kernelModules = [ "lz4" "z3fold" ];
  systemd.services.zswap-configure = {
    description = "Configure zswap";
    wantedBy = [ "multi-user.target" ];
    serviceConfig.Type = "oneshot";
    script = ''
      echo lz4 > /sys/module/zswap/parameters/compressor
      echo z3fold > /sys/module/zswap/parameters/zpool
    '';
  };

  # Setup networking
  networking = {
    hostName = "apollo";
    networkmanager.enable = true; 
    nameservers = [ "178.22.122.100" "185.51.200.2" ]; # Set DNS
  };
  #networking.proxy = { default = "https://localhost:8118/"; noProxy = "127.0.0.1,localhost,internal.domain"; };
  networking.firewall = {
    enable = true;
    allowPing = true;
    allowedTCPPorts = [
      5357 # wsdd
    ];
    allowedUDPPorts = [
      3702 # wsdd
    ];
  };

  # Setup tor
  services.tor = { 
    enable = true;
    client.enable = true;
    torsocks.enable = true;
  };

  services.tor.settings = {
    ExitNodes = "{DE}";
    #DNSPort = 9053;
    #UseBridges = true;
    #ClientTransportPlugin = "obfs4 exec ${pkgs.obfs4}/bin/obfs4proxy";
    #Bridge = "[bridge-address-here]";
  };

  services.privoxy = {
    enable = true;
    enableTor = true;
  };

  # Use tor for nix-shell 
  systemd.services.nix-daemon.environment = {
    HTTPS_PROXY = "socks5://localhost:9063/";
  };

  # Set time zone.
  time.timeZone = "Asia/Tehran";

  # Set environment variables
  environment.sessionVariables = {
    # VSCode under wayland
    NIXOS_OZONE_WL = "1"; 
    # Firefox wayland
    MOZ_ENABLE_WAYLAND = "1";
    EDITOR = "vim";
  };

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    earlySetup = true;
    font = "${pkgs.terminus_font}/share/consolefonts/ter-v14b.psf.gz";
    packages = with pkgs; [ terminus_font ];
    keyMap = "us";
  };

  # Setup X11
  services.xserver = {
    enable = true;
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;    
    videoDrivers = [ "nouveau" ];

    # Configure keymap in X11
    layout = "us";
    xkbVariant = "";
    
    # Enable touchpad support
    libinput.enable = true; 
  };

  # Exclude gnome bloat
  environment.gnome.excludePackages = (with pkgs; [
    gnome-tour
  ]) ++ (with pkgs.gnome; [
    cheese # webcam tool
    gnome-music
    gnome-maps
    gnome-characters
    epiphany # web browser
    totem # video player
    tali # poker game
    iagno # go game
    hitori # sudoku game
    atomix # puzzle game
  ]);

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # Enable QEMU
  virtualisation.libvirtd.enable = true;
  programs.dconf.enable = true;

  # Enable Docker
  virtualisation.docker.enable = true;

  # Change default user folders
  environment.etc."xdg/user-dirs.defaults".text = ''
    DOCUMENTS=documents
    DOWNLOAD=downloads
    MUSIC=music
    PICTURES=pictures
    PUBLICSHARE=public
    TEMPLATES=templates
    VIDEOS=videos
  '';

  # Define a user account
  users.users.matty = {
    isNormalUser = true;
    description = "Matty";
    extraGroups = [ "networkmanager" "wheel" "libvirtd" "docker" ];
    packages = (with pkgs; [
      firefox
      vlc
      papirus-icon-theme
      anki
      tor-browser-bundle-bin
      vscode-fhs
      foliate # epub reader
      gnome-epub-thumbnailer # Epub thumbnailer for nautilous
      qbittorrent
      virt-manager
      libreoffice
      hunspell # spell check for libre office
      obsidian
      git
    ]) ++ (with pkgs.gnome; [
      gnome-tweaks
      gucharmap
    ]) ++ (with pkgs.gnomeExtensions; [
      just-perfection
      rounded-window-corners
      unite
    ]);
  };

  # Enable automatic login for the user.
  #services.xserver.displayManager.autoLogin = { enable = true; user = "matty"; };

  # Workaround for GNOME autologin: https://github.com/NixOS/nixpkgs/issues/103746#issuecomment-945091229
  #systemd.services = { "getty@tty1".enable = false; "autovt@tty1".enable = false; };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  
  environment.systemPackages = (with pkgs; [
    vim
    wget
  ]);

  # Fonts
  fonts.fonts = with pkgs; [
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
  fonts.fontconfig.enable = true;
  fonts.fontconfig.defaultFonts = {
    monospace = [ "IntelOne Mono" ];
    serif = [ "Noto Serif" ];
    sansSerif = [ "Noto Sans" ];
  };

  # Setup samba
  # make shares visible for windows 10 clients
  services.samba-wsdd.enable = true; 
  services.samba = {
    enable = true;
    securityType = "user";
    openFirewall = true;
    extraConfig = ''
      workgroup = WORKGROUP
      #server string = ${config.networking.hostName}
      #netbios name = ${config.networking.hostName}
      #use sendfile = yes
      #max protocol = smb2
      # note: localhost is the ipv6 localhost ::1
      hosts allow = 192.168.0.0/16 localhost
      hosts deny = 0.0.0.0/0
      guest account = nobody
      map to guest = bad user
     '';
   };

  services.samba.shares.public = {
    path = "/home/matty/public";
    browseable = "yes";
    "read only" = "no";
    "public" = "yes";
    "writable" = "yes";
    "guest ok" = "yes";
    "guest only" = "yes";
    "force user" = "matty";
    #"force group" = "matty";
  };

  # Copies the configuration file to /run/current-system/configuration.nix
  system.copySystemConfiguration = true;

  system.stateVersion = "23.05";
}

