{pkgs, ...}: {
  # Boot settings
  boot = {
    kernelPackages = pkgs.linuxPackages_6_8;
    kernelParams = ["nvidia-drm.modeset=1" "quiet" "splash" "intel_iommu=on" "vfio-pci.ids=10de:13f0,10de:0fbb"];
    consoleLogLevel = 0;
    initrd.verbose = false;
    initrd.kernelModules = [
      "vfio_pci"
      "vfio"
      "vfio_iommu_type1"
      "vfio_virqfd"
      "nvidia"
      "nvidia_modeset"
      "nvidia_uvm"
      "nvidia_drm"
    ];
    loader.efi.canTouchEfiVariables = true;
    loader.systemd-boot.enable = true;
    plymouth.enable = true;
  };

  hardware.opengl.enable = true;
}
