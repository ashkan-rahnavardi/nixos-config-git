{pkgs, ...}: {
  home.packages = with pkgs; [
    ueberzugpp
    imagemagick # Already installed system level
    exiftool
    atool
    #   bsdtar -- not in nixstore
    unrar
    p7zip
    poppler_utils
    mupdf
    #   transmission-cli  -- not in nixstore
    odt2txt
    pandoc
    xlsx2csv
    lynx
    elinks
    jupyter
    mediainfo
    librsvg
    djvulibre
    fontforge
    sqlite
    highlight
    w3m
    pistol
    # python312Packages.pygments
  ];

  programs.ranger = {
    enable = true;

    extraConfig = ''
      set preview_images true
      set use_preview_script true
      set show_hidden true
      set preview_script ~/.local/bin/ranger_scope.sh
    '';

    # set preview_images_method ueberzugpp  -- setting ueberzugpp causes ranger to crash b/c its not recognized as an option

    # set preview_script /home/ash/.nix-profile/bin/pistol
  };
}
