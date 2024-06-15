{
  pkgs,
  config,
  ...
}: let
  # Change this to your username.
  user = "ash";
  # Change this to match your system's CPU.
  platform = "intel";
  # Change this to specify the IOMMU ids you wrote down earlier.
  vfioIds = ["10de:13f0" "10de:0fbb"];
in {
  # Configure kernel options to make sure IOMMU & KVM support is on.
  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };

    kernelPackages = pkgs.linuxPackages_6_8;
    kernelModules = ["kvm-${platform}" "vfio_virqfd" "vfio_pci" "vfio_iommu_type1" "vfio" "nvidia-drm.modeset=1"];
    kernelParams = ["${platform}_iommu=on" "${platform}_iommu=pt" "kvm.ignore_msrs=1"];
    # extraModprobeConfig = "options vfio-pci ids=${builtins.concatStringsSep "," vfioIds}";

    postBootCommands = ''
      DEVS="0000:02:00.0 0000:02:00.1"

      for DEV in $DEVS; do
        echo "vfio-pci" > /sys/bus/pci/devices/$DEV/driver_override
      done
      modprobe -i vfio-pci
    '';
  };

  # Add a file for looking-glass to use later. This will allow for viewing the guest VM's screen in a
  # performant way.
  systemd.tmpfiles.rules = [
    "f /dev/shm/looking-glass 0660 ${user} qemu-libvirtd -"
  ];

  # Add virt-manager and looking-glass to use later.
  environment.systemPackages = with pkgs; [
    virt-manager
    looking-glass-client
  ];

  # Enable virtualisation programs. These will be used by virt-manager to run your VM.
  virtualisation = {
    libvirtd = {
      enable = true;
      extraConfig = ''
        user="${user}"
      '';

      # Don't start any VMs automatically on boot.
      onBoot = "ignore";
      # Stop all running VMs on shutdown.
      onShutdown = "shutdown";

      qemu = {
        package = pkgs.qemu_kvm;
        # ovmf = enabled;
        verbatimConfig = ''
           namespaces = []
          user = "+${builtins.toString config.users.users.${user}.uid}"
        '';
      };
    };
  };

  hardware.opengl.enable = true;
  users.users.${user}.extraGroups = ["qemu-libvirtd" "libvirtd" "disk"];
}
