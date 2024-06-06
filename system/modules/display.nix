{pkgs, ...}: {
  # Enable OpenGL
  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };

  # Nvidia Tings
  hardware.nvidia = {
    # Modesetting is required
    modesetting.enable = true;
    # Enable this if you have graphical corruption issues
    # or application crashes after waking up from sleep.
    powerManagement.enable = false;
    # Experimental: Turns off GPU when not in use
    powerManagement.finegrained = false;
    # Use Nvidia open source kernel module
    # in alpha & not stable
    open = false;
    # Enable Nvidia settings menu, accessible via `nvidia-settings`
    nvidiaSettings = true;
  };

  # X11 settings
  services.xserver = {
    enable = true;
    xkb = {
      layout = "us";
      variant = "";
    };
    # Load Nvidia Drivers
    videoDrivers = ["nvidia"];
    # Exclude certain default packages
    excludePackages = with pkgs; [xterm];
    # Enable KDE Plasma 5 Desktop Environment
    desktopManager.plasma5.enable = true;
  };

  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    settings = {
      wayland = {
        enableHidpiSupport = true;
        enableVsync = true;
      };
    };
  };
}
