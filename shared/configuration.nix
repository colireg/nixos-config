{ nixpkgs, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  environment.sessionVariables = {
    EDITOR = "vim";
  };

  # Remove the desktop folder and set default user folder names to lowercase
  environment.etc."xdg/user-dirs.defaults".text = ''
    DOCUMENTS=documents
    DOWNLOAD=downloads
    MUSIC=music
    PICTURES=pictures
    PUBLICSHARE=public
    TEMPLATES=templates
    VIDEOS=videos
  '';

  services.pcscd.enable = true;
  programs.gnupg.agent = {
     enable = true;
     #pinentryFlavor = "gtk2";
     #enableSSHSupport = true;
  };

  # Exclude gnome bloat
  environment.gnome.excludePackages = (with pkgs; [
    gnome-tour
  ]) ++ (with pkgs.gnome; [
    cheese # webcam tool
    gnome-music
    gnome-maps
    gnome-characters
    epiphany # web browser
    totem # video player
    tali # poker game
    iagno # go game
    hitori # sudoku game
    atomix # puzzle game
  ]);

  environment.systemPackages = with pkgs; [
    vim
    git
  ];

  # Get completion for system packages for zsh
  environment.pathsToLink = [ "/share/zsh" ];

  programs.zsh = {
    enable = true;
    syntaxHighlighting.enable = true;
    autosuggestions.enable = true;
  };

  environment.shells = with pkgs; [ zsh ];
  users.defaultUserShell = pkgs.zsh;
}
