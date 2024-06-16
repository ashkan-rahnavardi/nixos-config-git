{...}: let
  hyprland_config = ./../../files/configs/hypr;
in {
  imports = ./extras;

  # imports = [
  #   ./clipboard.nix
  #   ./dconf-hyprland.nix
  #   ./swappy.nix
  #   ./swaync.nix
  #   ./waybar.nix
  #   ./wofi.nix
  #   ./xdg.nix
  #   ./hyprpaper.nix
  #   ./hyprlock.nix
  #   ./hypridle.nix
  # ];

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
