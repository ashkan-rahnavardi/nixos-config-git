{
  pkgs,
  lib,
  ...
}: let
  portalPackages = [pkgs.xdg-desktop-portal pkgs.xdg-desktop-portal-hyprland];
  joinedPortals = pkgs.buildEnv {
    name = "xdg-portals";
    paths = portalPackages;
    pathsToLink = ["/share/xdg-desktop-portal/portals" "/share/applications"];
  };
in {
  programs = {
    gnome-disks.enable = true;
    dconf.enable = true;
    hyprland.enable = true;
  };
  xdg.portal = {
    enable = lib.mkForce false;
    extraPortals = lib.mkForce [];
  };

  # Enables support for Bluetooth
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };

  # Enable Bluetooth support
  services.blueman.enable = true;

  security = {
    # rtkit.enable = true;  # Enabled in system.nix
    polkit.enable = true;
    pam.services = {
      hyprlock = {};
      gdm.enableGnomeKeyring = true;
      # gtklock.text = lib.readFile "${pkgs.gtklock}/etc/pam.d/gtklock";
      # "christian".enableGnomeKeyring = true;
    };
  };

  services = {
    gnome.gnome-keyring.enable = true;
    udisks2.enable = true;
    dbus.packages = portalPackages;
  };

  environment = {
    pathsToLink = ["/share/applications"];

    # Enable Ozone Wayland support in Chromium and Electron based applications
    sessionVariables = {
      XDG_DESKTOP_PORTAL_DIR = "${joinedPortals}/share/xdg-desktop-portal/portals";
      NIXOS_OZONE_WL = "1";
      XCURSOR_SIZE = "24";
      XCURSOR_THEME = "Yaru";
      QT_QPA_PLATFORMTHEME = "qt6ct";
      QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
    };
  };

  # List of Hyprland specific packages
  environment.systemPackages = with pkgs; [
    joinedPortals
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
  systemd = {
    packages = portalPackages;
    user.services.xdg-desktop-portal = {
      description = "Portal service";
      partOf = lib.mkForce [];
      serviceConfig = {
        Type = "dbus";
        BusName = "org.freedesktop.portal.Desktop";
        ExecStart = "${pkgs.xdg-desktop-portal}/libexec/xdg-desktop-portal";
        Slice = "session.slice";
      };
    };
    user.services.xdg-desktop-portal-hyprland = {
      description = "Portal service (Hyprland implementation)";
      partOf = lib.mkForce [];
      after = lib.mkForce [];
      serviceConfig = {
        Type = "dbus";
        BusName = "org.freedesktop.impl.portal.desktop.hyprland";
        ExecStart = "${pkgs.xdg-desktop-portal-hyprland}/libexec/xdg-desktop-portal-hyprland";
        Restart = "on-failure";
        Slice = "session.slice";
      };
    };
    user.services.polkit-gnome-authentication-agent-1 = {
      description = "polkit-gnome-authentication-agent-1";
      wantedBy = ["graphical-session.target"];
      wants = ["graphical-session.target"];
      after = ["graphical-session.target"];
      serviceConfig = {
        Type = "simple";
        ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
        Restart = "on-failure";
        RestartSec = 1;
        TimeoutStopSec = 10;
      };
    };
  };
}
