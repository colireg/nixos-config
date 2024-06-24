{ ... }:

{
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
}
