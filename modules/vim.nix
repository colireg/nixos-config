{ pkgs, ... }:

let
  vimConfig = {
    name = "vim";
    # Install plugins for example for syntax highlighting of nix files
    vimrcConfig.packages.myplugins = with pkgs.vimPlugins; {
      start = [ vim-nix vim-lastplace vim-polyglot ];
      opt = [ ];
    };
    vimrcConfig.customRC = ''
      noremap <Up> <Nop>
      noremap <Down> <Nop>
      noremap <Left> <Nop>
      noremap <Right> <Nop>
      set mouse=""
      set nowrap
      set number
      set relativenumber
    '';
  };
  customVim = pkgs.vim_configurable.customize vimConfig;
in
{
  programs.vim.defaultEditor = true;
  environment.systemPackages = [ customVim ];
}
