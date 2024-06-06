{...}: let
  wallpaper = builtins.toPath "/home/ash/Pictures/walls/rice/neon_car.png";
  wallpaper2 = builtins.toPath "/home/ash/Pictures/walls/rice/purp_jap.png";
  wallpaper3 = builtins.toPath "/home/ash/Pictures/walls/rice/rice_vert.png";
in {
  services.hyprpaper = {
    enable = true;

    settings = {
      splash = false;

      preload = [
        "${wallpaper}"
        "${wallpaper2}"
        "${wallpaper3}"
      ];

      wallpaper = [
        "DP-4,${wallpaper}"
        "DP-3,${wallpaper2}"
        "DP-1,${wallpaper3}"
      ];

      #     preload = [
      #       "${wallpaper}"
      #       "${wallpaper2}"
      #        "${wallpaper3}"
      #      ];

      #     wallpaper = [
      #       "DP-1,${wallpaper}"
      #       "DP-2,${wallpaper2}"
      #       "DP-3,${wallpaper3}"
      #      ];
    };
  };
}
