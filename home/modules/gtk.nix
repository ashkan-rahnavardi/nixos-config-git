{pkgs, ...}: let
  # Define theme name and configuration for GTK
  catppuccin_name = "Catppuccin-Macchiato-Standard-Lavender-Dark";
  catppuccin = pkgs.catppuccin-gtk.override {
    accents = ["lavender"];
    size = "standard";
    tweaks = ["normal"];
    variant = "macchiato";
  };
in {
  # GTK theme configuration
  gtk = {
    enable = true;
    theme = {
      name = catppuccin_name;
      package = catppuccin;
    };
    iconTheme = {
      name = "Tela-circle-dark";
      package = pkgs.tela-circle-icon-theme;
    };
    cursorTheme = {
      name = "Yaru";
      package = pkgs.yaru-theme;
    };
    font = {
      name = "Roboto";
      size = 11;
    };
    gtk3 = {
      bookmarks = [
        "file:///home/ash/Downloads/temp"
        "file:///home/ash/Documents/repositories"
      ];
    };
  };

  # Manage .gtkrc-2.0 with Home Manager
  home.file.".gtkrc-2.0" = {
    source = pkgs.writeText "gtkrc-2.0" ''
      gtk-theme-name="${catppuccin_name}"
      gtk-icon-theme-name="Tela-circle-dark"
      gtk-font-name="Roboto 11"
    '';
  };
}
