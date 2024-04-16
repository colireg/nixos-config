{ ... }:

{
  imports = [
    ./env.nix
    ./home.nix
    ./packages.nix

    ../home/dconf.nix
    ../home/gtk.nix
    ../home/nvim
    ../home/tmux.nix
    ../home/vscode.nix
  ];
}
