{ pkgs, ... }:

{
  environment.pathsToLink = [ "/libexec" ];
  services.displayManager.defaultSession = "xfce+i3";
  services.libinput.touchpad.naturalScrolling = true;
  services.gnome.gnome-keyring.enable = true;
  services.xserver = {
    enable = true;
    displayManager.lightdm = {
      background = "#000000";
      enable = true;
      greeters.gtk = {
        enable = true;
        theme.name = "Arc-Dark";
        theme.package = pkgs.arc-theme;
      };
    };
    desktopManager = {
      xterm.enable = false;
      xfce = {
        enable = true;
        noDesktop = true;
        enableXfwm = false;
      };
    };
    windowManager.i3 = {
      enable = true;
      extraPackages = with pkgs; [
        alacritty
        dmenu
        i3status # gives you the default i3 status bar
        i3blocks # if you are planning on using i3blocks over i3status
        arc-theme
        clipmenu
        brightnessctl
      ];
    };
  };

  # Fix GSettings schemas error
  environment.systemPackages = with pkgs; [ gtk3 ];
  environment.variables = {
    GSETTINGS_SCHEMA_DIR = "${pkgs.gtk3}/share/gsettings-schemas/${pkgs.gtk3.name}/glib-2.0/schemas";
  };
}
