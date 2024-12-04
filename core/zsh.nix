{ pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    syntaxHighlighting.enable = true;
    enableCompletion = true;
    autosuggestions.enable = true;
    autosuggestions.strategy = [ "completion" ];
    shellInit = ''
      bindkey '^[[A' fzf-history-widget
    '';
  };
  environment.shells = [ pkgs.zsh ];
  users.defaultUserShell = pkgs.zsh;

  # Get completion for system packages for zsh
  environment.pathsToLink = [ "/share/zsh" ];
  environment.sessionVariables = {
    ZSH_TMUX_UNICODE = "true";
    ZSH_TMUX_DEFAULT_SESSION_NAME = "default";
  };

  programs.fzf.fuzzyCompletion = true;
  programs.fzf.keybindings = true;

  environment.systemPackages = with pkgs; [ nix-index ];
  programs.command-not-found.enable = false;
  programs.zsh.interactiveShellInit = ''
    source ${pkgs.nix-index}/etc/profile.d/command-not-found.sh
  '';
}
