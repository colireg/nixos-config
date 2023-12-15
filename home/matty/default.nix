{
  imports = [
    ./dconf.nix
    ./env.nix
    ./git.nix
    ./gtk.nix
    ./packages.nix
  ];

  home = {
    username = "matty";
    homeDirectory = "/home/matty";
    stateVersion = "23.11";
  };

  programs.home-manager.enable = true;
}
