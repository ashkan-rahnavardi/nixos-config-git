{...}: let
  wallpaper = builtins.toPath "/home/ash/Pictures/walls/rice/neon_car.png";
  wallpaper2 = builtins.toPath "/home/ash/Pictures/walls/rice/purp_jap.png";
  wallpaper3 = builtins.toPath "/home/ash/Pictures/walls/rice/road-moon_vert.png";
  lock = builtins.toPath "/home/ash/Pictures/walls/rice/feet_on_dash.png";
  hyprland_config = ./../../files/configs/hypr;
in {
  imports = [
    ./clipboard.nix
    ./dconf-hyprland.nix
    #         ./kanshi.nix
    ./swappy.nix
    ./swaync.nix
    ./waybar.nix
    ./wofi.nix
    ./xdg.nix
  ];

  xdg.configFile = {
    "hypr" = {
      recursive = true;
      source = "${hyprland_config}";
    };

    "hypr/hyprpaper.conf".text = ''
      splash = false
      preload = ${wallpaper}
      preload = ${wallpaper2}
      preload = ${wallpaper3}
      wallpaper = DP-1, ${wallpaper}
      wallpaper = DP-2, ${wallpaper2}
      wallpaper = DP-3, ${wallpaper3}
    '';

    "hypr/hypridle.conf".text = ''
      general {
          lock_cmd = pidof hyprlock || hyprlock
          before_sleep_cmd = loginctl lock-session
          after_sleep_cmd = hyprctl dispatch dpms on
      }
    '';

    "hypr/hyprlock.conf".text = ''
      background {
          monitor =
          path = ${lock}
          blur_passes = 3
          contrast = 0.8916
          brightness = 0.8172
          vibrancy = 0.1696
          vibrancy_darkness = 0.0
      }

      general {
          no_fade_in = false
          grace = 0
          disable_loading_bar = true
      }

      # DP-1 Conifg
      input-field {
          monitor = DP-1
          size = 250, 60
          outline_thickness = 2
          dots_size = 0.2 # Scale of input-field height, 0.2 - 0.8
          dots_spacing = 0.2 # Scale of dots' absolute size, 0.0 - 1.0
          dots_center = true
          outer_color = rgba(0, 0, 0, 0)
          inner_color = rgba(0, 0, 0, 0.5)
          font_color = rgb(200, 200, 200)
          fade_on_empty = false
          capslock_color = -1
          placeholder_text = <i><span foreground="##e6e9ef">Password</span></i>
          fail_text = <i>$FAIL <b>($ATTEMPTS)</b></i>
          hide_input = false
          position = 0, -120
          halign = center
          valign = center
      }

      # Date
      label {
          monitor = DP-1
          text = cmd[update:1000] echo "<span>$(date '+%A, %d %B')</span>"
          color = rgba(255, 255, 255, 0.8)
          font_size = 15
          font_family = JetBrains Mono Nerd Font Mono ExtraBold
          position = 0, -400
          halign = center
          valign = top
      }

      # Time
      label {
          monitor = DP-1
          text = cmd[update:1000] echo "<span>$(date '+%H:%M')</span>"
          color = rgba(255, 255, 255, 0.8)
          font_size = 120
          font_family = JetBrains Mono Nerd Font Mono ExtraBold
          position = 0, -400
          halign = center
          valign = top
      }

      # Keyboard layout
      label {
          monitor = DP-1
          text = $LAYOUT
          color = rgba(255, 255, 255, 0.9)
          font_size = 10
          font_family = JetBrains Mono Nerd Font Mono
          position = 0, -175
          halign = center
          valign = center
      }

      # DP-2 Conifg
      input-field {
          monitor = DP-2
          size = 250, 60
          outline_thickness = 2
          dots_size = 0.2 # Scale of input-field height, 0.2 - 0.8
          dots_spacing = 0.2 # Scale of dots' absolute size, 0.0 - 1.0
          dots_center = true
          outer_color = rgba(0, 0, 0, 0)
          inner_color = rgba(0, 0, 0, 0.5)
          font_color = rgb(200, 200, 200)
          fade_on_empty = false
          capslock_color = -1
          placeholder_text = <i><span foreground="##e6e9ef">Password</span></i>
          fail_text = <i>$FAIL <b>($ATTEMPTS)</b></i>
          hide_input = false
          position = 0, -120
          halign = center
          valign = center
      }

      # Date
      label {
          monitor = DP-2
          text = cmd[update:1000] echo "<span>$(date '+%A, %d %B')</span>"
          color = rgba(255, 255, 255, 0.8)
          font_size = 15
          font_family = JetBrains Mono Nerd Font Mono ExtraBold
          position = 0, -400
          halign = center
          valign = top
      }

      # Time
      label {
          monitor = DP-2
          text = cmd[update:1000] echo "<span>$(date '+%H:%M')</span>"
          color = rgba(255, 255, 255, 0.8)
          font_size = 120
          font_family = JetBrains Mono Nerd Font Mono ExtraBold
          position = 0, -400
          halign = center
          valign = top
      }

      # Keyboard layout
      label {
          monitor = DP-2
          text = $LAYOUT
          color = rgba(255, 255, 255, 0.9)
          font_size = 10
          font_family = JetBrains Mono Nerd Font Mono
          position = 0, -175
          halign = center
          valign = center
      }

      # DP-3 Conifg
      input-field {
          monitor = DP-3
          size = 250, 60
          outline_thickness = 2
          dots_size = 0.2 # Scale of input-field height, 0.2 - 0.8
          dots_spacing = 0.2 # Scale of dots' absolute size, 0.0 - 1.0
          dots_center = true
          outer_color = rgba(0, 0, 0, 0)
          inner_color = rgba(0, 0, 0, 0.5)
          font_color = rgb(200, 200, 200)
          fade_on_empty = false
          capslock_color = -1
          placeholder_text = <i><span foreground="##e6e9ef">Password</span></i>
          fail_text = <i>$FAIL <b>($ATTEMPTS)</b></i>
          hide_input = false
          position = 0, -120
          halign = center
          valign = center
      }

      # Date
      label {
          monitor = DP-3
          text = cmd[update:1000] echo "<span>$(date '+%A, %d %B')</span>"
          color = rgba(255, 255, 255, 0.8)
          font_size = 15
          font_family = JetBrains Mono Nerd Font Mono ExtraBold
          position = 0, -400
          halign = center
          valign = top
      }

      # Time
      label {
          monitor = DP-3
          text = cmd[update:1000] echo "<span>$(date '+%H:%M')</span>"
          color = rgba(255, 255, 255, 0.8)
          font_size = 120
          font_family = JetBrains Mono Nerd Font Mono ExtraBold
          position = 0, -400
          halign = center
          valign = top
      }

      # Keyboard layout
      label {
          monitor = DP-3
          text = $LAYOUT
          color = rgba(255, 255, 255, 0.9)
          font_size = 10
          font_family = JetBrains Mono Nerd Font Mono
          position = 0, -175
          halign = center
          valign = center
      }
    '';
  };

  wayland.windowManager.hyprland = {
    enable = true;
  };
}
