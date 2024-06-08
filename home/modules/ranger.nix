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
    '';
  };
}
