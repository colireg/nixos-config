{
  services.xserver = {
    enable = true;
    layout = "us"; # Configure keymap in X11
    xkbVariant = "";
    libinput.enable = true; # Enable touchpad support
  };
}
