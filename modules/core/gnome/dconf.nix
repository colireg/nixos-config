{ lib, ... }:

{
  programs.dconf.profiles.user.databases = [{
    settings = with lib.gvariant; {
      "org/gnome/desktop/input-sources" = {
        sources = [ (mkTuple [ "xkb" "us" ]) (mkTuple [ "xkb" "ir+pes_keypad" ]) ];
        xkb-options = [ "terminate:ctrl_alt_bksp" ];
      };

      "org/gnome/desktop/interface" = {
        color-scheme = "prefer-dark";
        cursor-theme = "Adwaita";
        document-font-name = "Noto Sans 11";
        font-name = "Noto Sans 11";
        gtk-theme = "Adwaita-dark";
        icon-theme = "Adwaita";
        locate-pointer = true;
        monospace-font-name = "IntelOne Mono Medium 10";
      };

      "org/gnome/desktop/peripherals/keyboard" = {
        numlock-state = false;
      };

      "org/gnome/desktop/peripherals/touchpad" = {
        tap-to-click = true;
        two-finger-scrolling-enabled = true;
      };

      "org/gnome/desktop/wm/keybindings" = {
        close = [ "<Super>w" ];
        maximize = [ "<Super>k" ];
        minimize = mkEmptyArray type.string;
        move-to-workspace-1 = [ "<Shift><Super>1" ];
        move-to-workspace-2 = [ "<Shift><Super>2" ];
        move-to-workspace-3 = [ "<Shift><Super>3" ];
        move-to-workspace-4 = [ "<Shift><Super>4" ];
        move-to-workspace-left = [ "<Shift><Super>h" ];
        move-to-workspace-right = [ "<Shift><Super>l" ];
        panel-run-dialog = mkEmptyArray type.string;
        switch-applications = mkEmptyArray type.string;
        switch-applications-backward = mkEmptyArray type.string;
        switch-group = mkEmptyArray type.string;
        switch-group-backward = mkEmptyArray type.string;
        switch-to-workspace-1 = [ "<Super>1" ];
        switch-to-workspace-2 = [ "<Super>2" ];
        switch-to-workspace-3 = [ "<Super>3" ];
        switch-to-workspace-4 = [ "<Super>4" ];
        switch-to-workspace-left = [ "<Control><Super>h" ];
        switch-to-workspace-right = [ "<Control><Super>l" ];
        switch-windows = [ "<Alt>Tab" ];
        switch-windows-backward = [ "<Shift><Alt>Tab" ];
        unmaximize = [ "<Super>j" ];
      };

      "org/gnome/desktop/wm/preferences" = {
        button-layout = "appmenu:close";
        titlebar-font = "Noto Sans Bold 11";
        action-middle-click-titlebar = "lower";
      };

      "org/gnome/mutter" = {
        dynamic-workspaces = true;
        edge-tiling = true;
        workspaces-only-on-primary = true;
      };

      "org/gnome/mutter/keybindings" = {
        toggle-tiled-left = [ "<Super>h" ];
        toggle-tiled-right = [ "<Super>l" ];
      };

      "org/gnome/settings-daemon/plugins/media-keys" = {
        custom-keybindings = [ "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/" ];
        next = [ "<Control><Super>Right" ];
        play = [ "<Control><Super>Down" ];
        previous = [ "<Control><Super>Left" ];
        stop = [ "<Control><Super>Up" ];
        volume-down = [ "<Super>F11" ];
        volume-mute = [ "<Super>F10" ];
        volume-up = [ "<Super>F12" ];
      };

      "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
        binding = "<Super>Return";
        command = "kgx";
        name = "Open Console";
      };

      "org/gnome/shell" = {
        disable-user-extensions = false;
        enabled-extensions = [ "just-perfection-desktop@just-perfection" "unite@hardpixel.eu" ];
      };

      "org/gnome/shell/extensions/just-perfection" = {
        dash = false;
        panel = false;
        search = false;
      };

      "org/gnome/shell/extensions/unite" = {
        extend-left-box = false;
        hide-window-titlebars = "always";
        notifications-position = "center";
        show-window-buttons = "never";
        show-window-title = "never";
      };

      "org/gnome/shell/keybindings" = {
        switch-to-application-1 = mkEmptyArray type.string;
        switch-to-application-2 = mkEmptyArray type.string;
        switch-to-application-3 = mkEmptyArray type.string;
        switch-to-application-4 = mkEmptyArray type.string;
      };
    };
  }];
}


