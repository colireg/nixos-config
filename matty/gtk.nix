{ pkgs, ... }:

{
  gtk.enable = true;
  gtk.theme = "Dracula";
  gtk.gtk3.extraConfig.Settings = "gtk-application-prefer-dark-theme=1";
  gtk.gtk4.extraConfig.Settings = "gtk-application-prefer-dark-theme=1";
  gtk.iconTheme = {
    name = "ePapirus-Dark";
    package = pkgs.papirus-icon-theme;
  };
}
