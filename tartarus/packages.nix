{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    wget
    openssh
    zip
    unzip
    parted
    bat # cat
    ripgrep
    ncdu # disk usage
    duf
    jq
    nnn
    jcal
    lsof
    restic

    nixfmt
    statix
    vulnix
  ];
  programs.htop.enable = true;
  programs.fzf.fuzzyCompletion = true;
  programs.fzf.keybindings = true;
}
