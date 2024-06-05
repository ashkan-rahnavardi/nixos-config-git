{...}: {
  # Install git via home-manager module
  programs.git = {
    enable = true;
    userName = "ash";
    userEmail = "ashkan.rahnavardi@gmail.com";
    delta = {
      enable = true;
      options = {
        keep-plus-minus-markers = true;
        light = false;
        line-numbers = true;
        navigate = true;
        syntax-theme = "catppuccin";
        width = 280;
      };
    };
    extraConfig = {
      pull.rebase = "true";
      init.defaultBranch = "main";
    };
  };
}
