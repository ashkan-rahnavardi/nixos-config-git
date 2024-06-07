{...}: {
  # Install wofi via home-manager module
  programs.wofi = {
    enable = true;
    settings = {
      insensitive = true;
      normal_window = true;
      prompt = "𝗚𝗼𝗱'𝘀 𝗦𝗼𝗻";
      width = "50%";
      height = "40%";
      key_up = "Ctrl-k";
      key_down = "Ctrl-j";
    };
  };
}
