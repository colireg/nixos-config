{ pkgs, ... }:

{
  programs.tmux.plugins = with pkgs.tmuxPlugins; [
    {
      plugin = "dracula";
      extraConfig = ''
        set -g @dracula-show-battery false
        set -g @dracula-show-powerline true
        set -g @dracula-refresh-rate 10
      '';
    }
  ];
}
