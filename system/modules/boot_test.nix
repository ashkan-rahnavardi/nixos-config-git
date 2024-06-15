{pkgs, ...}: {
  # Boot settings
  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };

    kernelParams = ["intel_iommu=on"];
    blacklistedKernelModules = ["nvidia" "nouveau"];
    kernelModules = ["kvm-intel" "vfio_virqfd" "vfio_pci" "vfio_iommu_type1" "vfio"];

    postBootCommands = ''
      DEVS="0000:02:00.0 0000:02:00.1"

      for DEV in $DEVS; do
        echo "vfio-pci" > /sys/bus/pci/devices/$DEV/driver_override
      done
      modprobe -i vfio-pci
    '';

    # kernelPackages = pkgs.linuxPackages_6_8;
    # kernelParams = ["nvidia-drm.modeset=1" "quiet" "splash"];
    # consoleLogLevel = 0;
    # initrd.verbose = false;
    #
    # plymouth.enable = true;
  };

  # hardware.opengl.enable = true;
}
