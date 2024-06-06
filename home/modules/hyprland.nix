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
    ./hyprpaper.nix
  ];

  xdg.configFile = {
    "hypr" = {
      recursive = true;
      source = "${hyprland_config}";
    };

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

      # dp-1 conifg
      input-field {
          monitor = dp-1
          size = 250, 60
          outline_thickness = 2
          dots_size = 0.2 # scale of input-field height, 0.2 - 0.8
          dots_spacing = 0.2 # scale of dots' absolute size, 0.0 - 1.0
          dots_center = true
          outer_color = rgba(0, 0, 0, 0)
          inner_color = rgba(0, 0, 0, 0.5)
          font_color = rgb(200, 200, 200)
          fade_on_empty = false
          capslock_color = -1
          placeholder_text = <i><span foreground="##e6e9ef">password</span></i>
          fail_text = <i>$fail <b>($attempts)</b></i>
          hide_input = false
          position = 0, -120
          halign = center
          valign = center
      }

      # date
      label {
          monitor = dp-1
          text = cmd[update:1000] echo "<span>$(date '+%a, %d %b')</span>"
          color = rgba(255, 255, 255, 0.8)
          font_size = 15
          font_family = jetbrains mono nerd font mono extrabold
          position = 0, -400
          halign = center
          valign = top
      }

      # time
      label {
          monitor = dp-1
          text = cmd[update:1000] echo "<span>$(date '+%h:%m')</span>"
          color = rgba(255, 255, 255, 0.8)
          font_size = 120
          font_family = jetbrains mono nerd font mono extrabold
          position = 0, -400
          halign = center
          valign = top
      }

      # keyboard layout
      label {
          monitor = dp-1
          text = $layout
          color = rgba(255, 255, 255, 0.9)
          font_size = 10
          font_family = jetbrains mono nerd font mono
          position = 0, -175
          halign = center
          valign = center
      }

      # dp-2 conifg
      input-field {
          monitor = dp-2
          size = 250, 60
          outline_thickness = 2
          dots_size = 0.2 # scale of input-field height, 0.2 - 0.8
          dots_spacing = 0.2 # scale of dots' absolute size, 0.0 - 1.0
          dots_center = true
          outer_color = rgba(0, 0, 0, 0)
          inner_color = rgba(0, 0, 0, 0.5)
          font_color = rgb(200, 200, 200)
          fade_on_empty = false
          capslock_color = -1
          placeholder_text = <i><span foreground="##e6e9ef">password</span></i>
          fail_text = <i>$fail <b>($attempts)</b></i>
          hide_input = false
          position = 0, -120
          halign = center
          valign = center
      }

      # date
      label {
          monitor = dp-2
          text = cmd[update:1000] echo "<span>$(date '+%a, %d %b')</span>"
          color = rgba(255, 255, 255, 0.8)
          font_size = 15
          font_family = jetbrains mono nerd font mono extrabold
          position = 0, -400
          halign = center
          valign = top
      }

      # time
      label {
          monitor = dp-2
          text = cmd[update:1000] echo "<span>$(date '+%h:%m')</span>"
          color = rgba(255, 255, 255, 0.8)
          font_size = 120
          font_family = jetbrains mono nerd font mono extrabold
          position = 0, -400
          halign = center
          valign = top
      }

      # keyboard layout
      label {
          monitor = dp-2
          text = $layout
          color = rgba(255, 255, 255, 0.9)
          font_size = 10
          font_family = jetbrains mono nerd font mono
          position = 0, -175
          halign = center
          valign = center
      }

      # dp-3 conifg
      input-field {
          monitor = dp-3
          size = 250, 60
          outline_thickness = 2
          dots_size = 0.2 # scale of input-field height, 0.2 - 0.8
          dots_spacing = 0.2 # scale of dots' absolute size, 0.0 - 1.0
          dots_center = true
          outer_color = rgba(0, 0, 0, 0)
          inner_color = rgba(0, 0, 0, 0.5)
          font_color = rgb(200, 200, 200)
          fade_on_empty = false
          capslock_color = -1
          placeholder_text = <i><span foreground="##e6e9ef">password</span></i>
          fail_text = <i>$fail <b>($attempts)</b></i>
          hide_input = false
          position = 0, -120
          halign = center
          valign = center
      }

      # date
      label {
          monitor = dp-3
          text = cmd[update:1000] echo "<span>$(date '+%a, %d %b')</span>"
          color = rgba(255, 255, 255, 0.8)
          font_size = 15
          font_family = jetbrains mono nerd font mono extrabold
          position = 0, -400
          halign = center
          valign = top
      }

      # time
      label {
          monitor = dp-3
          text = cmd[update:1000] echo "<span>$(date '+%h:%m')</span>"
          color = rgba(255, 255, 255, 0.8)
          font_size = 120
          font_family = jetbrains mono nerd font mono extrabold
          position = 0, -400
          halign = center
          valign = top
      }

      # keyboard layout
      label {
          monitor = dp-3
          text = $layout
          color = rgba(255, 255, 255, 0.9)
          font_size = 10
          font_family = jetbrains mono nerd font mono
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
