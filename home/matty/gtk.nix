{ pkgs, ... }:

{
  gtk = {
    enable = true;
    gtk3.extraConfig.Settings = "gtk-application-prefer-dark-theme=1";
    gtk4.extraConfig.Settings = "gtk-application-prefer-dark-theme=1";
    iconTheme = {
      name = "ePapirus-Dark";
      package = pkgs.papirus-icon-theme;
    };
  };
}
