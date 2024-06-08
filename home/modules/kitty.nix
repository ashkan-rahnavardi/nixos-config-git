{...}: {
  programs.kitty = {
    enable = true;

    shellIntegration.enableZshIntegration = true;

    # font = {
    #   size = 12;
    #   normal = {
    #     family = "JetBrainsMono Nerd Font";
    #     style = "Regular";
    #   };
    #   bold = {
    #     family = "JetBrainsMono Nerd Font";
    #     style = "Bold";
    #   };
    #   italic = {
    #     family = "JetBrainsMono Nerd Font";
    #     style = "Italic";
    #   };
    #   bold_italic = {
    #     family = "JetBrainsMono Nerd Font";
    #     style = "Italic";
    #   };
    # };

    settings = {
      scrollback_lines = 10000;
      wheel_scroll_multiplier = 5;
      window_padding_width = 15;
      hide_window_decorations = "yes";
      background_opacity = "0.7";

      font_size = 12;
      font_family = "JetBrainsMono Nerd Font Regular";
    };

    theme = "Wild Cherry";
  };
}
