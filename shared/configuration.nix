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

  environment.systemPackages = with pkgs; [
    vim
    git
  ];
}