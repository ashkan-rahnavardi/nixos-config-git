{
  pkgs,
  config,
  ...
}: {
  # Boot settings
  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };

    kernelPackages = pkgs.linuxPackages_6_8;
    kernelParams = ["intel_iommu=on"];
    kernelModules = ["nvidia-drm.modeset=1" "kvm-intel" "vfio" "vfio_iommu_type1" "vfio_pci" "vfio_virqfd"];
    extraModprobeConfig = ''
      options vfio-pci ids=10de:13f0,10de:0fbb
    '';
  };

  # Enable libvirt and QEMU
  virtualisation.libvirtd = {
    enable = true;
    qemu = {
      ovmf.enable = true;
      package = pkgs.qemu_kvm;
    };
    extraConfig = ''
      nvram = [
        "/nix/store/*-OVMF_CODE.fd:/usr/share/OVMF/OVMF_CODE.fd"
        "/nix/store/*-OVMF_VARS.fd:/usr/share/OVMF/OVMF_VARS.fd"
      ]
    '';
  };

  users.users.ash.extraGroups = ["libvirtd"];

  hardware.opengl.enable = true;
}
