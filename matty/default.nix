{ ... }:

{
  imports = [
    ./env.nix
    ./packages.nix

    ../home/gtk.nix
    ../home/nvim
    ../home/tmux.nix
    ../home/vscode
  ];

  # For bluetooth
  services.mpris-proxy.enable = true;
  home.username = "matty";
  home.homeDirectory = "/home/matty";
  home.stateVersion = "24.05";
  programs.home-manager.enable = true;
}
