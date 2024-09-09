{ pkgs, ... }:

{
  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
    wrapperFeatures.base = true;
    xwayland.enable = true;
    extraPackages = with pkgs; [
      grim # screenshot functionality
      wl-clipboard # wl-copy and wl-paste for copy/paste from stdin / stdout
      mako # notification system developed by swaywm maintainer
      i3status
      i3status-rust
      dmenu
      wmenu
      foot
      brightnessctl
    ];
  };

  programs.waybar.enable = true;
  services.gnome.gnome-keyring.enable = true;

  services.xserver = {
    enable = true;
    displayManager.gdm.enable = true;
  };

  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1"; # VSCode wayland
    MOZ_ENABLE_WAYLAND = "1"; # Firefox wayland
    ELECTRON_OZONE_PLATFORM_HINT = "auto";
  };

  services.displayManager.defaultSession = "sway";

}
