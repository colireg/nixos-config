{ pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    syntaxHighlighting.enable = true;
    enableCompletion = true;
    autosuggestions.enable = true;
    autosuggestions.strategy = [ "completion" ];
    promptInit = ''PROMPT="%{$fg[green]%}%%%{$reset_color%} "'';
  };
  programs.zsh.ohMyZsh = {
    enable = true;
    theme = "imajes";
    plugins = [ "sudo" "git" "vi-mode" "tmux" ];
  };
  environment.shells = [ pkgs.zsh ];
  users.defaultUserShell = pkgs.zsh;

  # Get completion for system packages for zsh
  environment.pathsToLink = [ "/share/zsh" ];
  environment.sessionVariables = {
    ZSH_TMUX_UNICODE = "true";
    ZSH_TMUX_DEFAULT_SESSION_NAME = "default";
    ZSH_TMUX_AUTOSTART = "true";
  };
}
