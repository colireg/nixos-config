{ pkgs, home-manager, ... }:

{
  home-manager.users.matty.gtk = {
    enable = true;

    iconTheme = {
      name = "ePapirus-Dark";
      package = pkgs.papirus-icon-theme;
    };

    gtk3.extraConfig = {
      Settings = ''
        gtk-application-prefer-dark-theme=1
      '';
    };

    gtk4.extraConfig = {
      Settings = ''
        gtk-application-prefer-dark-theme=1
      '';
    };
  };
}