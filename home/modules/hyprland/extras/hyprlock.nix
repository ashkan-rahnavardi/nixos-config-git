{...}: let
  lock = /home/ash/Pictures/walls/rice/feet_on_dash.png;
in {
  programs.hyprlock = {
    enable = true;

    settings = {
      background = [
        {
          monitor = "";
          path = "${lock}";
          blur_passes = 3;
          contrast = 0.8916;
          brightness = 0.8172;
          vibrancy = 0.1696;
          vibrancy_darkness = 0.0;
        }
      ];

      general = [
        {
          no_fade_in = false;
          grace = 0;
          disable_loading_bar = true;
        }
      ];

      input-field = [
        {
          size = "250, 60";
          position = "0, -80";
          monitor = "";
          dots_center = true;
          dots_size = 0.2;
          dots_spacing = 0.2;
          fade_on_empty = false;
          font_color = "rgb(202, 211, 245)";
          inner_color = "rgb(91, 96, 120)";
          outer_color = "rgb(24, 25, 38)";
          outline_thickness = 5;
          placeholder_text = ''<span foreground="##cad3f5">Password...</span>'';
          shadow_passes = 2;
        }
      ];

      label = [
        {
          monitor = "";
          text = ''$TIME'';
          color = "rgba(200,200,200,1.0)";
          font_size = 25;
          font_family = "Jetbrains mono nerd font mono extrabold";
          rotate = 0;
          position = "0, 80";
          halign = "center";
          valign = "center";
        }
      ];
    };
  };
}
# # dp-1 conifg
# input-field = [
# {
#     monitor = "dp-1";
#     size = "250, 60";
#     outline_thickness = 2;
#     dots_size = 0.2; # scale of input-field height, 0.2 - 0.8
#     dots_spacing = 0.2; # scale of dots' absolute size, 0.0 - 1.0
#     dots_center = true;
#     outer_color = "rgba(0, 0, 0, 0)";
#     inner_color = "rgba(0, 0, 0, 0.5)";
#     font_color = "rgb(200, 200, 200)";
#     fade_on_empty = false;
#     capslock_color = -1;
#     placeholder_text = '\'<i><span foreground="##e6e9ef">password</span></i>'\';
#     fail_text = '\'<i>$fail <b>($attempts)</b></i>'\';
#     hide_input = false;
#     position = "0, -120";
#     halign = "center";
#     valign = "center";
# }
# ];
#
# # date
# label = [
# {
#     monitor = "dp-1";
#     text = '\'"<span>$(date '+%a, %d %b')</span>"'\';
#     color = "rgba(255, 255, 255, 0.8)";
#     font_size = 15;
#     font_family = "jetbrains mono nerd font mono extrabold";
#     position = "0, -400";
#     halign = "center";
#     valign = "top";
# }
# ];
# label = [ {
#     monitor = "dp-1"
#     text = '\'cmd[update:1000] echo "<span>$(date '+%h:%m')</span>"'\';
#     color = "rgba(255, 255, 255, 0.8)";
#     font_size = 120;
#     font_family = "jetbrains mono nerd font mono extrabold";
#     position = "0, -400";
#     halign = "center";
#     valign = "top";
# };];
#
# # keyboard layout
# label = [ {
#     monitor = "dp-1";
#     text = "$LAYOUT";
#     color = "rgba(255, 255, 255, 0.9)";
#     font_size = 10;
#     font_family = "jetbrains mono nerd font mono";
#     position = "0, -175";
#     halign = "center";
#     valign = "center";
# };];
# # dp-2 conifg
# input-field {
#     monitor = dp-4
#     size = 250, 60
#     outline_thickness = 2
#     dots_size = 0.2 # scale of input-field height, 0.2 - 0.8
#     dots_spacing = 0.2 # scale of dots' absolute size, 0.0 - 1.0
#     dots_center = true
#     outer_color = rgba(0, 0, 0, 0)
#     inner_color = rgba(0, 0, 0, 0.5)
#     font_color = rgb(200, 200, 200)
#     fade_on_empty = false
#     capslock_color = -1
#     placeholder_text = <i><span foreground="##e6e9ef">password</span></i>
#     fail_text = <i>$fail <b>($attempts)</b></i>
#     hide_input = false
#     position = 0, -120
#     halign = center
#     valign = center
# }
#
# # date
# label {
#     monitor = dp-4
#     text = cmd[update:1000] echo "<span>$(date '+%a, %d %b')</span>"
#     color = rgba(255, 255, 255, 0.8)
#     font_size = 15
#     font_family = jetbrains mono nerd font mono extrabold
#     position = 0, -400
#     halign = center
#     valign = top
# }
#
# # time
# label {
#     monitor = dp-4
#     text = cmd[update:1000] echo "<span>$(date '+%h:%m')</span>"
#     color = rgba(255, 255, 255, 0.8)
#     font_size = 120
#     font_family = jetbrains mono nerd font mono extrabold
#     position = 0, -400
#     halign = center
#     valign = top
# }
#
# # keyboard layout
# label {
#     monitor = dp-4
#     text = $layout
#     color = rgba(255, 255, 255, 0.9)
#     font_size = 10
#     font_family = jetbrains mono nerd font mono
#     position = 0, -175
#     halign = center
#     valign = center
# }
#
# # dp-3 conifg
# input-field {
#     monitor = dp-3
#     size = 250, 60
#     outline_thickness = 2
#     dots_size = 0.2 # scale of input-field height, 0.2 - 0.8
#     dots_spacing = 0.2 # scale of dots' absolute size, 0.0 - 1.0
#     dots_center = true
#     outer_color = rgba(0, 0, 0, 0)
#     inner_color = rgba(0, 0, 0, 0.5)
#     font_color = rgb(200, 200, 200)
#     fade_on_empty = false
#     capslock_color = -1
#     placeholder_text = <i><span foreground="##e6e9ef">password</span></i>
#     fail_text = <i>$fail <b>($attempts)</b></i>
#     hide_input = false
#     position = 0, -120
#     halign = center
#     valign = center
# }
#
# # date
# label {
#     monitor = dp-3
#     text = cmd[update:1000] echo "<span>$(date '+%a, %d %b')</span>"
#     color = rgba(255, 255, 255, 0.8)
#     font_size = 15
#     font_family = jetbrains mono nerd font mono extrabold
#     position = 0, -400
#     halign = center
#     valign = top
# }
#
# # time
# label {
#     monitor = dp-3
#     text = cmd[update:1000] echo "<span>$(date '+%h:%m')</span>"
#     color = rgba(255, 255, 255, 0.8)
#     font_size = 120
#     font_family = jetbrains mono nerd font mono extrabold
#     position = 0, -400
#     halign = center
#     valign = top
# }
#
# # keyboard layout
# label {
#     monitor = dp-3
#     text = $layout
#     color = rgba(255, 255, 255, 0.9)
#     font_size = 10
#     font_family = jetbrains mono nerd font mono
#     position = 0, -175
#     halign = center
#     valign = center
# }
#       }
#   }
