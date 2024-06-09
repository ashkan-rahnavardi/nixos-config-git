{...}: let
  hyprland_config = ./../../files/configs/hypr;
in {
  imports = [
    ./clipboard.nix
    ./dconf-hyprland.nix
    ./swappy.nix
    ./swaync.nix
    ./waybar.nix
    ./wofi.nix
    ./xdg.nix
    ./hyprpaper.nix
    ./hyprlock.nix
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
