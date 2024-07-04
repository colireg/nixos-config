{ pkgs, ... }:

{
  environment.pathsToLink = [ "/libexec" ];
  services.displayManager.defaultSession = "xfce+i3"; 
  services.libinput.touchpad.naturalScrolling = true;
  services.xserver = {
    enable = true;
    displayManager = {
      lightdm.enable = true;
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
        i3lock # default i3 screen locker
        i3blocks # if you are planning on using i3blocks over i3status
        dunst # Notification deamon

        arc-theme
        clipmenu
      ];
    };
  };
}
