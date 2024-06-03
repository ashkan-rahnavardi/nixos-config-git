{
  description = "My first flake!";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-24.05";
    home-manager.url = "github:nix-community/home-manager/release-24.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    hyprland.url = "github:hyprwm/Hyprland?submodules=1";
  };

  outputs = { self, nixpkgs, home-manager, hyprland, ... }:
    let
      lib = nixpkgs.lib;
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      nixosConfigurations = {
        nixos = lib.nixosSystem {
          inherit system;
          modules = [ ./configuration.nix ];
        };
      };

      homeConfigurations = {
        ash = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [
            ./home.nix
            hyprland.homeManagerModules.default
            {
              programs.hyprland.enable = true;
              settings = {
                main = {
                  monitor = "eDP-1,1920x1080@60Hz,1";
                  wallpaper = "/home/ash/Pictures/walls/RetroWave/sunset.png";
                };
              };
              extraConfig = ''
                # Additional Hyprland configuration settings
              '';
            }
          ];
        };
      };
  };
}


# {
#
#
#   description = "My first flake!";
#
#
#   inputs = {
#     nixpkgs.url = "nixpkgs/nixos-24.05";
#     home-manager.url = "github:nix-community/home-manager/release-24.05";
#     home-manager.inputs.nixpkgs.follows = "nixpkgs";
#     hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
#   };
#
#
#   outputs = { self, nixpkgs, home-manager, hyprland, ...}:
#     let
#       lib = nixpkgs.lib;
#       system = "x86_64-linux";
#       pkgs = nixpkgs.legacyPackages.${system};
#     in {
#     nixosConfigurations = {
#       nixos = lib.nixosSystem {
#         inherit system;
#         modules = [ ./configuration.nix ];
#       };
#     };
#     homeConfigurations = {
#       ash = home-manager.lib.homeManagerConfiguration {
#         inherit pkgs;
#         modules = [
#           ./home.nix
#           hyprland.homeManagerModules.default
#           {wayland.windowManager.hyprland.enable = true;}
#         ];
#       };
#     };
#   };
#
# }
