{ pkgs, ... }:

{
  boot.loader = { systemd-boot.enable = true; efi.canTouchEfiVariables = true; };

  boot.supportedFilesystems = [ "ntfs" ];

  networking = {
    hostName = "apollo";
    networkmanager.enable = true; 
    nameservers = [ "178.22.122.100" "185.51.200.2" ];
    firewall.enable = true;
    firewall.allowPing = true;
  };
  
  time.timeZone = "Asia/Tehran";

  i18n.defaultLocale = "en_US.UTF-8";

  console = {
    earlySetup = true;
    font = "${pkgs.terminus_font}/share/consolefonts/ter-v14b.psf.gz";
    packages = with pkgs; [ terminus_font ];
    keyMap = "us";
  };

  services.xserver = {
    enable = true;
    videoDrivers = [ "nouveau" ];
    # Configure keymap in X11
    layout = "us";
    xkbVariant = "";
    # Enable touchpad support
    libinput.enable = true; 
  };

  # Enable virtualization
  virtualisation.libvirtd.enable = true;
  programs.dconf.enable = true;
  environment.systemPackages = with pkgs; [ virt-manager ];
  virtualisation.docker.enable = true;

  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  users.users.matty = {
    isNormalUser = true;
    description = "Matty";
    extraGroups = [ "networkmanager" "wheel" "libvirtd" "docker" "tor" ];
  };

  nix.settings.trusted-users = [ "matty" ];

  system.stateVersion = "23.05";
}