{...}: {
  imports = [
    ./hardware-configuration.nix
    ./modules/system.nix
    ./modules/display.nix
    ./modules/common-apps.nix
    ./modules/hyprland.nix
  ];

  # Set hostname
  networking.hostName = "nixos"; # Define your hostname.

  swapDevices = [
    {
      device = "/swapfile";
      size = 4076;
    }
  ];

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  system.stateVersion = "23.11"; # Did you read the comment?
}
