{ pkgs, ... }:

{
  fonts.fontconfig.enable = true;
  fonts.fontconfig.defaultFonts = {
    monospace = [ "IntelOne Mono" ];
    serif = [ "Noto Serif" ];
    sansSerif = [ "Noto Sans" ];
  };
  fonts.packages = with pkgs; [
    intel-one-mono
    fira-code
    fira
    jetbrains-mono
    fira-code-symbols
    nerdfonts
    terminus_font
    terminus_font_ttf
    noto-fonts
    noto-fonts-emoji
    noto-fonts-lgc-plus
    noto-fonts-cjk-sans
    noto-fonts-cjk-serif
    noto-fonts-emoji-blob-bin
    liberation_ttf
  ];
}
