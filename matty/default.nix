{ ... }:

{
  imports = [
    ./env.nix
    ./packages.nix

    ../modules/home/gtk.nix
    ../modules/home/nvim
    ../modules/home/tmux.nix
    ../modules/home/vscode
  ];

  # For bluetooth
  services.mpris-proxy.enable = true;
  home.username = "matty";
  home.homeDirectory = "/home/matty";
  home.stateVersion = "23.11";
  programs.home-manager.enable = true;
}
