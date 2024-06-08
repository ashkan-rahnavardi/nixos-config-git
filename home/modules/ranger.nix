{...}: {
  programs.ranger = {
    enable = true;

    extraConfig = ''
      set preview_images true
      set show_hidden true
      set preview_images_method ueberzug
    '';
  };
}
