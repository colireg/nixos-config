# Generated via dconf2nix: https://github.com/gvolpe/dconf2nix
{ lib, ... }:

with lib.hm.gvariant;

{
  dconf.settings = {
    "org/gnome/desktop/background" = {
      picture-uri = "file://${./resources/background.png}";
    };

    "org/gnome/desktop/input-sources" = {
      sources = [ (mkTuple [ "xkb" "us" ]) (mkTuple [ "xkb" "ir+pes_keypad" ]) ];
    };

    "org/gnome/desktop/peripherals/touchpad" = {
      tap-to-click = true;
      two-finger-scrolling-enabled = true;
    };

    "org/gnome/shell" = {
      disable-user-extensions = false;
      disabled-extensions = [ "user-theme@gnome-shell-extensions.gcampax.github.com" ];
      enabled-extensions = [ "rounded-window-corners@yilozt" "just-perfection-desktop@just-perfection" "unite@hardpixel.eu" ];
      last-selected-power-profile = "performance";
    };

    "org/gnome/mutter" = {
      dynamic-workspaces = true;
      edge-tiling = true;
      workspaces-only-on-primary = true;
    };

    "org/gnome/desktop/interface" = {
      clock-show-seconds = false;
      clock-show-weekday = true;
      color-scheme = "prefer-dark";
      document-font-name = "Noto Sans 11";
      enable-animations = true;
      font-antialiasing = "grayscale";
      font-hinting = "slight";
      font-name = "Noto Sans 11";
      gtk-theme = "Adwaita-dark";
      icon-theme = "ePapirus-Dark";
      locate-pointer = true;
      monospace-font-name = "IntelOne Mono Medium 10";
    };

    "org/gnome/desktop/wm/preferences" = {
      button-layout = "appmenu:close";
      titlebar-font = "Noto Sans Bold 11";
    };

    "org/gnome/desktop/wm/keybindings" = {
      close = [ "<Super>w" ];
      minimize = [];
      move-to-workspace-1 = [ "<Shift><Super>1" ];
      move-to-workspace-2 = [ "<Shift><Super>2" ];
      move-to-workspace-3 = [ "<Shift><Super>3" ];
      move-to-workspace-4 = [ "<Shift><Super>4" ];
      panel-run-dialog = [ "<Super>Return" ];
      switch-to-workspace-1 = [ "<Super>1" ];
      switch-to-workspace-2 = [ "<Super>2" ];
      switch-to-workspace-3 = [ "<Super>3" ];
      switch-to-workspace-4 = [ "<Super>4" ];
    };

    "org/gnome/settings-daemon/plugins/color" = {
      night-light-enabled = true;
      night-light-schedule-automatic = true;
      night-light-temperature = mkUint32 3064;
    };

    "org/gnome/settings-daemon/plugins/media-keys" = {
      magnifier-zoom-in = [ "<Super>KP_Add" ];
      magnifier-zoom-out = [ "<Super>KP_Subtract" ];
      next = [ "<Control><Super>Right" ];
      play = [ "<Control><Super>Down" ];
      previous = [ "<Control><Super>Left" ];
      stop = [ "<Control><Super>Up" ];
      volume-down = [ "<Super>F11" ];
      volume-mute = [ "<Super>F10" ];
      volume-up = [ "<Super>F12" ];
    };

    "org/gnome/settings-daemon/plugins/power" = {
      power-button-action = "hibernate";
      sleep-inactive-ac-type = "nothing";
    };

    "org/gnome/shell/extensions/just-perfection" = {
      accessibility-menu = true;
      activities-button-icon-monochrome = false;
      app-menu = true;
      app-menu-icon = true;
      background-menu = true;
      controls-manager-spacing-size = 0;
      dash = false;
      dash-icon-size = 0;
      double-super-to-appgrid = false;
      gesture = true;
      hot-corner = false;
      looking-glass-width = 0;
      notification-banner-position = 1;
      osd = true;
      panel = false;
      panel-arrow = true;
      panel-corner-size = 0;
      panel-in-overview = true;
      ripple-box = true;
      search = false;
      show-apps-button = true;
      startup-status = 0;
      theme = false;
      window-demands-attention-focus = false;
      window-picker-icon = true;
      window-preview-caption = true;
      window-preview-close-button = true;
      workspace = true;
      workspace-background-corner-size = 0;
      workspace-popup = true;
      workspace-switcher-should-show = false;
      workspace-wrap-around = true;
      workspaces-in-app-grid = true;
    };

    "org/gnome/shell/extensions/rounded-window-corners" = {
      custom-rounded-corner-settings = "@a{sv} {}";
      global-rounded-corner-settings = "{'padding': <{'left': <uint32 1>, 'right': <uint32 1>, 'top': <uint32 1>, 'bottom': <uint32 1>}>, 'keep_rounded_corners': <{'maximized': <false>, 'fullscreen': <false>}>, 'border_radius': <uint32 12>, 'smoothing': <uint32 0>}";
      settings-version = mkUint32 5;
    };

    "org/gnome/shell/extensions/unite" = {
      enable-titlebar-actions = false;
      extend-left-box = false;
      greyscale-tray-icons = true;
      hide-activities-button = "never";
      hide-window-titlebars = "always";
      notifications-position = "center";
      reduce-panel-spacing = false;
      show-desktop-name = false;
      show-legacy-tray = true;
      show-window-buttons = "never";
      show-window-title = "never";
      window-buttons-placement = "right";
    };

    "org/gnome/shell/world-clocks" = {
      locations = "[<(uint32 2, <('Berlin', 'EDDT', true, [(0.91746141594945008, 0.23241968454167572)], [(0.91658875132345297, 0.23387411976724018)])>)>]";
    };

    "org/gnome/terminal/legacy" = {
      theme-variant = "dark";
    };

    "org/gnome/tweaks" = {
      show-extensions-notice = false;
    };

  };
}
