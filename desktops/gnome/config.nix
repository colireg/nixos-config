{ pkgs, config, ... }:

{
  services.xserver.desktopManager.gnome.enable = true;
  services.xserver.displayManager.gdm.enable = true;

  # Enable automatic login for the user.
  #services.xserver.displayManager.autoLogin = { enable = true; user = "${config.home.username}"; };

  # Workaround for GNOME autologin: https://github.com/NixOS/nixpkgs/issues/103746#issuecomment-945091229
  #systemd.services = { "getty@tty1".enable = false; "autovt@tty1".enable = false; };
}