{ pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    withNodeJs = true;
    withPython3 = true;
    configure.customRC = ''
      set nowrap
      set number
      set relativenumber
    '';
  };
  programs.neovim.defaultEditor = true;
}
