{...}: let
  hyprland_config = ./../../../files/configs/hypr;
in {
  imports = [
    ./extras/clipboard.nix
    ./extras/dconf-hyprland.nix
    ./extras/swappy.nix
    ./extras/swaync.nix
    ./extras/waybar.nix
    ./extras/wofi.nix
    ./extras/xdg.nix
    ./extras/hyprpaper.nix
    ./extras/hyprlock.nix
    ./extras/hypridle.nix
  ];

  xdg.configFile = {
    "hypr" = {
      recursive = true;
      source = "${hyprland_config}";
    };
  };

  wayland.windowManager.hyprland = {
    enable = true;
  };
}
