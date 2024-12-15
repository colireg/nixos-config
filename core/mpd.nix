{
  pkgs,
  username,
  config,
  ...
}:

{
  services.mpd = {
    enable = true;
    musicDirectory = "/home/${username}/Music";
    group = username;
    user = username;
    startWhenNeeded = true;
    extraConfig = ''
      auto_update "yes"
      audio_output {
        type "pipewire"
        name "My PipeWire Output"
      }
    '';
  };

  systemd.services.mpd.environment = {
    # XDG_RUNTIME_DIR = "/run/user/${toString config.users.users.${username}.uid}";
    XDG_RUNTIME_DIR = "/run/user/1000";
  };

  users.users.${username}.packages = with pkgs; [ ario ];
}
