{...}: let
  wallpaper = builtins.toPath "/home/ash/Pictures/walls/rice/neon_car.png";
  lock = builtins.toPath "/home/ash/Pictures/walls/rice/purp_jap.png";
in {

  wayland.windowManager.hyprland = {
    enable = true;

    extraConfig = ''
    '';
  };


}

