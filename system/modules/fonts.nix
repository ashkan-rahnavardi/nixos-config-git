{inputs, ...}: {
  # Fonts configuration
  fonts.packages = with inputs.nixpkgs.legacyPackages.x86_64-linux; [
    (nerdfonts.override {fonts = ["Meslo" "JetBrainsMono"];})
    roboto
  ];
}
