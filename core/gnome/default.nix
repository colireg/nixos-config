{ pkgs, ... }:

{
  imports = [
    #./dconf.nix
  ];

  services.xserver = {
    enable = true;
    desktopManager.gnome.enable = true;
    displayManager.gdm.enable = true;
    displayManager.gdm.wayland = true;
    displayManager.defaultSession = "gnome";
  };

  environment.systemPackages = (with pkgs; [
    foliate # EPUB reader
    gnome-epub-thumbnailer # EPUB thumbnailer for Nautilous
    gnome.gnome-tweaks
    gnome.gucharmap # Character map
    gnome-solanum # Pomodoro timer
    newsflash # RSS reader
  ]);

  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1"; # VSCode wayland
    MOZ_ENABLE_WAYLAND = "1"; # Firefox wayland
    ELECTRON_OZONE_PLATFORM_HINT = "auto";
  };
}
