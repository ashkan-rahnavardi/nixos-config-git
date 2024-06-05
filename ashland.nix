 {pkgs, ...}: {

    programs.hyprland.enable = true;

    # List of Hyprland specific packages
    environment.systemPackages = with pkgs; [

        hyprpaper

    ];
}
