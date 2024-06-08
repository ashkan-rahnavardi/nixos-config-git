{pkgs, ...}: {
  home.packages = with pkgs; [
    ueberzug
    imagemagick
    w3m
    pistol
    python312Packages.typecode-libmagic
  ];

  programs.ranger = {
    enable = true;

    extraConfig = ''
      set preview_images true
      set preview_images_method ueberzug
      set show_hidden true
      set preview_script /home/ash/.nix-profile/bin/pistol
    '';
  };
}
