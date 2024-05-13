{ pkgs, ... }:

{
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };
  hardware.bluetooth.settings = {
    General = {
      Enable = "Source,Sink,Media,Socket";
      Experimental = true;
    };
  };
  services.blueman.enable = true;
  #hardware.pulseaudio.configFile = pkgs.writeText "default.pa" ''
  #  load-module module-bluetooth-policy
  #  load-module module-bluetooth-discover
  #  ## module fails to load with 
  #  ##   module-bluez5-device.c: Failed to get device path from module arguments
  #  ##   module.c: Failed to load module "module-bluez5-device" (argument: ""): initialization failed.
  #  # load-module module-bluez5-device
  #  # load-module module-bluez5-discover
  #'';
}
