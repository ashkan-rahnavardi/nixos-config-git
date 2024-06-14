{
  inputs,
  pkgs,
  ...
}: let
  spicePkgs = inputs.spicetify-nix.packages.${pkgs.system}.default;
in {
  imports = [
    # Spicetify
    inputs.spicetify-nix.homeManagerModule
  ];

  programs.spicetify = {
    enable = true;
    theme = spicePkgs.themes.text;
    colorScheme = "rosepine";

    enabledExtensions = with spicePkgs.extensions; [
      keyboardShortcut
      shuffle
      fullAppDisplay
      playlistIcons
    ];
  };
}
