{pkgs, ...}: {
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.ash = {
    isNormalUser = true;
    description = "ash";
    extraGroups = ["networkmanager" "wheel" "docker" "storage"];
    shell = pkgs.zsh;
  };

  # Zsh configuration
  programs.zsh = {
    enable = true;
  };

  # Enable passwordless sudo
  security.sudo.wheelNeedsPassword = false;
}
