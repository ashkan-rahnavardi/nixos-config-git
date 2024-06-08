{pkgs, ...}: {
  home.packages = with pkgs; [
    ueberzugpp
    w3m
  ];

  programs.ranger = {
    enable = true;

    extraConfig = ''
      set preview_images true
      set show_hidden true
      set preview_images_method ueberzugpp
    '';

    rifle = ''
      mime ^image, has ueberzugpp, terminal = ueberzugpp %s
    '';
  };
}
