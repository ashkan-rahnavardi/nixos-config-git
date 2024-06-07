{pkgs, ...}: {
  # Call dbus-update-activation-environment on login
  services.xserver.updateDbusEnvironment = true;

  # Enables support for Bluetooth
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };

  # Enable Bluetooth support
  services.blueman.enable = true;

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
    #  nvidiaPatches = true;
    portalPackage =
      pkgs.xdg-desktop-portal-wlr
      // {
        override = args: pkgs.xdg-desktop-portal-wlr.override (builtins.removeAttrs args ["hyprland"]);
      };
  };

  # Enable security services
  services.gnome.gnome-keyring.enable = true;
  security.polkit.enable = true;
  security.pam.services = {
    hyprlock = {};
    gdm.enableGnomeKeyring = true;
  };

  # Enable Ozone Wayland support in Chromium and Electron based applications
  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    XCURSOR_SIZE = "24";
    XCURSOR_THEME = "Yaru";
    QT_QPA_PLATFORMTHEME = "qt6ct";
    QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
  };

  # List of Hyprland specific packages
  environment.systemPackages = with pkgs; [
    evince # gnome document viewer
    gnome-text-editor
    gnome.file-roller # archive manager
    gnome.gnome-calculator
    gnome.gnome-weather
    gnome.nautilus # file manager
    gnome.pomodoro
    gnome.seahorse # keyring manager
    gnome.totem # Video player
    loupe # image viewer

    # Qt Wayland Support
    qt6.qtwayland
    qt5.qtwayland

    brightnessctl
    grim
    hypridle
    hyprlock
    hyprpaper
    libnotify
    networkmanagerapplet
    pamixer
    pavucontrol
    slurp
    swappy
    tesseract
    wf-recorder
    wlr-randr
    #  wlsunset
  ];

  # Stylix stuff
  # stylix = {
  #   image = /home/ash/Pictures/walls/rice/neon_car.png;
  #
  #   cursor = {
  #     package = pkgs.bibata-cursors;
  #     name = "Bibata-Modern-Ice";
  #   };
  #
  #   fonts = {
  #     monospace = {
  #       package = pkgs.nerdfonts.override {fonts = ["JetBrainsMono"];};
  #       name = "JetBrainsMono Nerd Font Mono";
  #     };
  #     sansSerif = {
  #       package = pkgs.dejavu_fonts;
  #       name = "DejaVu Sans";
  #     };
  #     serif = {
  #       package = pkgs.dejavu_fonts;
  #       name = "DejaVu Serif";
  #     };
  #   };
  # };
}
