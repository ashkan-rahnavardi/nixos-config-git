{


  description = "My first flake!";


  inputs = {
    nixpkgs.url = "nixpkgs/nixos-24.05";
    home-manager.url = "github:nix-community/home-manager/release-24.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    # NixOS Spicetify
    spicetify-nix.url = "github:MichaelPachec0/spicetify-nix";
    spicetify-nix.inputs.nixpkgs.follows = "nixpkgs";
#     hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
#
#     hyprland-plugins = {
#       url = "github:hyprwm/hyprland-plugins";
#       inputs.hyprland.follows = "hyprland";
#     };

  };


  outputs = { self, nixpkgs, home-manager, spicetify-nix, ...}:
    let
      lib = nixpkgs.lib;
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in {
    nixosConfigurations = {
      nixos = lib.nixosSystem {
        inherit system;
#         specialArgs = { inherit inputs; }; # this is the important part
        modules = [ ./system/configuration.nix ];
      };
    };
    homeConfigurations = {
      ash = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [
          ./home/home.nix
        ];
      };
    };
  };

}


