{ pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    configure.customRC = ''
      set nowrap
      set number
      set relativenumber
    '';
  };
}
