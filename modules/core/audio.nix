{ pkgs, username, ... }:

{
  hardware.pulseaudio = {
    enable = true;
    package = pkgs.pulseaudioFull;
  };
  hardware.pulseaudio.support32Bit = true;
  users.extraUsers.${username}.extraGroups = [ "audio" ];
}
