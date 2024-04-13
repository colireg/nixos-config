{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    wget
    openssh
    zip
    parted
    bat # cat
    ripgrep
    fzf
    ncdu # disk usage
    htop
    duf
  ];
}
