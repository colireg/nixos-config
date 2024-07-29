{ pkgs, ... }:

{
  programs.tmux = {
    enable = true;
    clock24 = true;
    extraConfig = ''
      set -g mouse on
      set-window-option -g mode-keys vi
      bind-key -T copy-mode-vi v send -X begin-selection
      bind-key -T copy-mode-vi V send -X select-line
      bind-key -T copy-mode-vi y send -X copy-pipe-and-cancel 'xclip -in -selection clipboard'
      bind-key C-n command-prompt -p "New session:" "new-session -s '%%'"
    '';
  };
  environment.systemPackages = [ pkgs.xclip ];
}
