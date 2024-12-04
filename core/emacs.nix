{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    emacs-gtk
    (aspellWithDicts (
      dicts: with dicts; [
        en
        en-computers
        fa
        de
        he
      ]
    ))
  ];
}
