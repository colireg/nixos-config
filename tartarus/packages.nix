{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    wget
    openssh
    zip
    parted
    bat # cat
    ripgrep
    ncdu # disk usage
    duf
  ];
  programs.htop.enable = true;
  programs.fzf.fuzzyCompletion = true;
  programs.fzf.keybindings = true;
}
