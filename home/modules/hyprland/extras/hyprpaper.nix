{...}: let
  rice1 = builtins.toPath "/home/ash/Pictures/walls/rice/neon_car.png";
  rice2 = builtins.toPath "/home/ash/Pictures/walls/rice/purp_jap.png";
  rice3 = builtins.toPath "/home/ash/Pictures/walls/rice/rice_vert.png";
  leaf1 = builtins.toPath "/home/ash/Pictures/walls/dark/leaf.png";
  leaf2 = builtins.toPath "/home/ash/Pictures/walls/dark/leaf2.png";
  leaf3 = builtins.toPath "/home/ash/Pictures/walls/dark/leaf_vert.png";
in {
  services.hyprpaper = {
    enable = true;

    settings = {
      splash = false;

      preload = [
        "${rice1}"
        "${rice2}"
        "${rice3}"
        "${leaf1}"
        "${leaf2}"
        "${leaf3}"
      ];

      wallpaper = [
        "DP-4,${rice1}"
        "DP-3,${rice2}"
        "DP-1,${rice3}"
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
