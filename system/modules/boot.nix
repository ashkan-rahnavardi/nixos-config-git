{pkgs, ...}: {
  # Boot settings
  boot = {
    kernelPackages = pkgs.linuxPackages_6_8;
    kernelParams = ["nvidia-drm.modeset=1" "quiet" "splash"];
    consoleLogLevel = 0;
    initrd.verbose = false;

    loader.efi.canTouchEfiVariables = true;
    loader.systemd-boot.enable = true;
    plymouth.enable = true;
  };

  hardware.opengl.enable = true;
}
