{ pkgs, ... }:

{
  programs.vscode = {
    enable = true;
    package = pkgs.vscode-fhs;
    #languageSnippets = import ./snippets.nix;
    #userSettings = import ./settings.nix;
  };
}
