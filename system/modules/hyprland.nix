{
  pkgs,
  config,
  ...
}: {
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
    # portalPackage = [pkgs.xdg-desktop-portal-hyprland pkgs.xdg-desktop-portal-gtk];
    #  nvidiaPatches = true;
    # portalPackage =
    #   pkgs.xdg-desktop-portal-wlr
    #   // {
    #     override = args: pkgs.xdg-desktop-portal-wlr.override (builtins.removeAttrs args ["hyprland"]);
    #   };
  };

  # # enable gnome portal
  xdg.portal = {
    enable = true;
    extraPortals = [pkgs.xdg-desktop-portal-gtk];
  };

  # Enable dconf for config settings
  programs.dconf.enable = true;

  # Enable Ozone Wayland support in Chromium and Electron based applications
  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    XCURSOR_SIZE = "24";
    XCURSOR_THEME = "Yaru";

    # XDG specs often detected through portals, doesn't hurt to set them explicility
    # XDG_SESSION_DESKTOP = "Hyprland";
    # XDG_CURRENT_DESKTOP = "Hyprland";
    # XDG_SESSION_TYPE = "wayland";
    # XDG_RUNTIME_DIR = "/run/user/${config.users.users.ash.uid}";

    # QT Variables
    # QT_QPA_PLATFORM = "wayland;xcb";
    QT_QPA_PLATFORMTHEME = "qt6ct";
    QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";

    # GTK Variables
    # GDK_BACKEND = "wayland,x11,*";
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
    gnome.gnome-disk-utility
    # libGL
    # libGLU
    # tracker
    mpv
    # Qt Wayland Support
    qt6.qtwayland
    qt5.qtwayland

    pyprland
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
