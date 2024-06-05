 {pkgs, ...}: {

    programs.hyprland = {
        enable = true;
        systemd.extraCommands = [
            ''wlr-randr --output HDMI-A-1 --mode 1920x1080@144''
        ];
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
        QT_QPA_PLATFORMTHEME = "qt5ct";
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
        wlsunset
    ];
}
