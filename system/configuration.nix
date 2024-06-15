{
  lib,
  config,
  inputs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ./modules/boot.nix
    ./modules/users.nix
    ./modules/locale.nix
    ./modules/fonts.nix
    ./modules/display.nix
    ./modules/peripherals.nix
    ./modules/security.nix
    ./modules/display.nix
    ./modules/common-apps.nix
    ./modules/hyprland.nix
    ./modules/virtualization.nix
  ];

  # nixpkgs configuration
  nixpkgs.config.allowUnfree = true;

  # This will add each flake input as a registry
  # To make nix3 commands consistent with your flake
  nix.registry = (lib.mapAttrs (_: flake: {inherit flake;})) ((lib.filterAttrs (_: lib.isType "flake")) inputs);

  # This will additionally add your inputs to the system's legacy channels
  # Making legacy nix commands consistent as well, awesome!
  nix.nixPath = ["/etc/nix/path"];
  environment.etc =
    lib.mapAttrs'
    (name: value: {
      name = "nix/path/${name}";
      value.source = value.flake;
    })
    config.nix.registry;

  # Add ~/.local/bin to PATH
  environment.localBinInPath = true;

  nix.settings = {
    # Enable flakes and new 'nix' command
    experimental-features = "nix-command flakes";
    # Deduplicate and optimize nix store
    auto-optimise-store = true;
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  system.stateVersion = "23.11"; # Did you read the comment?
}
