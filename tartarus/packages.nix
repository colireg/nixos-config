{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    wget
    openssh
    zip
    parted
    eza # ls
    bat # cat
    ripgrep
    fzf
    entr # execute code when a file changes
    mc # file manager
    ncdu # disk usage
    lshw # hardware detail
  ];
}
