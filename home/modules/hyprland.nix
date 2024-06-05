{...}: let
  wallpaper = builtins.toPath "/home/ash/Pictures/walls/rice/neon_car.png";
  lock = builtins.toPath "/home/ash/Pictures/walls/rice/purp_jap.png";
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
    "hypr/hyprpaper.conf".text = ''
      splash = false
      preload = ${wallpaper}
      wallpaper = DP-1, ${wallpaper}
      wallpaper = DP-2, ${wallpaper}
      wallpaper = DP-3, ${wallpaper}
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

    systemd.extraCommands = [
      ''wlr-randr --output DP-1 --mode 2560x1440144''
    ];

    extraConfig = ''

                  # Monitors
                  monitor = DP-1, 2560x1440144.00HZ, 0x0, 1
                  monitor = DP-2, 1920x1080@60.00HZ, 0x-1080, 1, transform, 2
                  monitor = DP-3, 1920x1080@60.00HZ, -1080x-640, 1, transform, 1

                  # Execute your favorite apps at launch
                  exec-once = bash ./../../files/scripts/hyprland_startup_script.sh
                  exec-once = hyprpaper
                  exec-once = hypridle
                  exec-once = gnome-keyring-daemon --start --components=secrets
                  exec-once = kanshi
                  exec-once = nm-applet —-indicator
                  exec-once = swaync
                  exec-once = ulauncher --hide-window
                  exec-once = waybar
                  exec-once = wl-paste --watch cliphist store
                  exec-once = wlsunset -l 49.28 -L 123.12

                  # Source a file (multi-file configs)
                  # source = ~/.config/hypr/myColors.conf

                  # Some default env vars.
                  env = XCURSOR_SIZE,24


                  # For all categories, see https://wiki.hyprland.org/Configuring/Variables/
                  input {
                      kb_layout = us
                      kb_variant =
                      kb_model =
                      kb_options =
                      kb_rules =

                      follow_mouse = 1

                      touchpad {
                          natural_scroll = false
                      }

                      sensitivity = 0 # -1.0 - 1.0, 0 means no modification.
                  }

                  general {
                      # See https://wiki.hyprland.org/Configuring/Variables/ for more

                      gaps_in = 5
                      gaps_out = 20
                      border_size = 2
                      col.active_border = rgba(33ccffee) rgba(00ff99ee) 45deg
                      col.inactive_border = rgba(595959aa)
                      layout = dwindle
                  }

                  decoration {
                      # See https://wiki.hyprland.org/Configuring/Variables/ for more

                      rounding = 10

                      blur {
                          enabled = true
                          size = 3
                          passes = 1
                      }

                      drop_shadow = true
                      shadow_range = 4
                      shadow_render_power = 3
                      col.shadow = rgba(1a1a1aee)
                  }

                  animations {
                      enabled = true

                      # Some default animations, see https://wiki.hyprland.org/Configuring/Animations/ for more

                      bezier = myBezier, 0.05, 0.9, 0.1, 1.05

                      animation = windows, 1, 7, myBezier
                      animation = windowsOut, 1, 7, default, popin 80%
                      animation = border, 1, 10, default
                      animation = borderangle, 1, 8, default
                      animation = fade, 1, 7, default
                      animation = workspaces, 1, 6, default
                  }

                  dwindle {
                      # See https://wiki.hyprland.org/Configuring/Dwindle-Layout/ for more
                      pseudotile = true # master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
                      preserve_split = true # you probably want this
                  }

                  master {
                      # See https://wiki.hyprland.org/Configuring/Master-Layout/ for more
                      new_is_master = true
                  }

                  gestures {
                      # See https://wiki.hyprland.org/Configuring/Variables/ for more
                      workspace_swipe = false
                  }

                  misc {
                      # See https://wiki.hyprland.org/Configuring/Variables/ for more
                      disable_hyprland_logo = true
                      disable_splash_rendering = true
                  }

                  # Example per-device config
                  # See https://wiki.hyprland.org/Configuring/Keywords/#per-device-input-configs for more

                  # Example windowrule v1
                  # windowrule = float, ^(kitty)$
                  # Example windowrule v2
                  # windowrulev2 = float,class:^(kitty)$,title:^(kitty)$
                  # See https://wiki.hyprland.org/Configuring/Window-Rules/ for more


                  # See https://wiki.hyprland.org/Configuring/Keywords/ for more
                  $mainMod = SUPER

                  # Example binds, see https://wiki.hyprland.org/Configuring/Binds/ for more
                  # bind = $mainMod, Q, exec, kitty
                  bind = $mainMod, RETURN, exec, alacritty
                  # bind = $mainMod, C, killactive,
                  bind = $mainMod SHIFT, B, exec, brave
                  bind = $mainMod, Q, killactive,
                  bind = $mainMod, M, exit,
                  bind = $mainMod, E, exec, dolphin
                  # bind = $mainMod, V, togglefloating,
                  bind = $mainMod, T, togglefloating,
                  bind = $mainMod, F, fullscreen
                  bind = $mainMod CTRL, RETURN, exec, rofi -show drun
                  bind = $mainMod, P, pseudo, # dwindle
                  bind = $mainMod, J, togglesplit, # dwindle
                  bind = $mainMod, B, exec, chromium

                  # Move focus with mainMod + arrow keys
                  bind = $mainMod, left, movefocus, l
                  bind = $mainMod, right, movefocus, r
                  bind = $mainMod, up, movefocus, u
                  bind = $mainMod, down, movefocus, d

                  # Switch workspaces with mainMod + [0-9]
                  bind = $mainMod, 1, workspace, 1
                  bind = $mainMod, 2, workspace, 2
                  bind = $mainMod, 3, workspace, 3
                  bind = $mainMod, 4, workspace, 4
                  bind = $mainMod, 5, workspace, 5
                  bind = $mainMod, 6, workspace, 6
                  bind = $mainMod, 7, workspace, 7
                  bind = $mainMod, 8, workspace, 8
                  bind = $mainMod, 9, workspace, 9
                  bind = $mainMod, 0, workspace, 10

                  # Move active window to a workspace with mainMod + SHIFT + [0-9]
                  bind = $mainMod SHIFT, down, movetoworkspace, 1
                  bind = $mainMod SHIFT, up, movetoworkspace, 2
                  bind = $mainMod SHIFT, left, movetoworkspace, 3
      #             bind = $mainMod SHIFT, 4, movetoworkspace, 4
      #             bind = $mainMod SHIFT, 5, movetoworkspace, 5
      #             bind = $mainMod SHIFT, 6, movetoworkspace, 6
      #             bind = $mainMod SHIFT, 7, movetoworkspace, 7
      #             bind = $mainMod SHIFT, 8, movetoworkspace, 8
      #             bind = $mainMod SHIFT, 9, movetoworkspace, 9
      #             bind = $mainMod SHIFT, 0, movetoworkspace, 10

                  # Scroll through existing workspaces with mainMod + scroll
                  bind = $mainMod, mouse_down, workspace, e+1
                  bind = $mainMod, mouse_up, workspace, e-1

                  # Move/resize windows with mainMod + LMB/RMB and dragging
                  bindm = $mainMod, mouse:272, movewindow
                  bindm = $mainMod, mouse:273, resizewindow

                  # Application menu
                  bind = $mainMod, Space, exec, wofi --show drun --allow-images

                  # Center focused window
                  bind = CTRL ALT, C, centerwindow

                  # Clipboard
                  bind = ALT SHIFT, V, exec, cliphist list | wofi --show dmenu | cliphist decode | wl-copy

                  # Screenshot area
                  bind = $mainMod SHIFT, S, exec, grim -g "$(slurp)" - | swappy -f -

                  # Screenshot entire screen
                  bind = $mainMod CTRL, S, exec, grim - | swappy -f -

                  # Screen recording
                  bind = $mainMod SHIFT, R, exec, $HOME/.local/bin/screen-recorder

                  # OCR
                  bind = ALT SHIFT, 2, exec, grim -t png -g "$(slurp)" - | tesseract stdin stdout -l "eng+rus+pol" | tr -d '\f' | wl-copy

                  # Lock screen
                  bind = $mainMod SHIFT, L, exec, hyprlock

                  # Adjust brightness
                  bind = , XF86MonBrightnessUp, exec, brightnessctl set +10%
                  bind = , XF86MonBrightnessDown, exec, brightnessctl set 10%-

                  # Open notifications
                  bind = $mainMod, V, exec, swaync-client -t -sw

                  # Adjust  volume
                  bind = , XF86AudioRaiseVolume, exec, pamixer -i 10
                  bind = , XF86AudioLowerVolume, exec, pamixer -d 10
                  bind = , XF86AudioMute, exec, pamixer -t
                  bind = , XF86AudioMicMute, exec, pamixer --default-source --toggle-mute

    '';
  };
}
