{ pkgs, ... }:

{

  programs.zsh = {
    enable = true;
    syntaxHighlighting.enable = true;
    enableCompletion = true;
    autosuggestions.enable = true;
    autosuggestions.strategy = [ "completion" ];
  };
  programs.zsh.ohMyZsh = {
    enable = true;
    theme = "essembeh";
    plugins = [ "sudo" "git" "vi-mode" "tmux" ];
  };
  environment.shells = with pkgs; [ zsh ];
  users.defaultUserShell = pkgs.zsh;

  # Get completion for system packages for zsh
  environment.pathsToLink = [ "/share/zsh" ];
  environment.sessionVariables = {
    ZSH_TMUX_AUTOSTART_ONCE = "true";
    ZSH_TMUX_AUTOCONNECT = "true";
    ZSH_TMUX_UNICODE = "true";
    ZSH_TMUX_DEFAULT_SESSION_NAME = "default";
  };
}
