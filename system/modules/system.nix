{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {
  # nixpkgs configuration
  nixpkgs = {
    config = {
      allowUnfree = true;
    };
  };

  # This will add each flake input as a registry
  # To make nix3 commands consistent with your flake
  nix.registry = (lib.mapAttrs (_: flake: {inherit flake;})) ((lib.filterAttrs (_: lib.isType "flake")) inputs);

  # This will additionally add your inputs to the system's legacy channels
  # Making legacy nix commands consistent as well, awesome!
  nix.nixPath = ["/etc/nix/path"];
  environment.etc =
    lib.mapAttrs'
    (name: value: {
      name = "nix/path/${name}";
      value.source = value.flake;
    })
    config.nix.registry;

  nix.settings = {
    # Enable flakes and new 'nix' command
    experimental-features = "nix-command flakes";
    # Deduplicate and optimize nix store
    auto-optimise-store = true;
  };

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

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/Vancouver";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_CA.UTF-8";

  # Add ~/.local/bin to PATH
  environment.localBinInPath = true;

  # Enable CUPS to print documents.
  services.printing.enable = false;

  # Enable storage services
  services.devmon.enable = true;

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.ash = {
    isNormalUser = true;
    description = "ash";
    extraGroups = ["networkmanager" "wheel" "docker"];
    shell = pkgs.zsh;
  };

  # Enable passwordless sudo
  security.sudo.wheelNeedsPassword = false;

  # Fonts configuration
  fonts.packages = with inputs.nixpkgs.legacyPackages.x86_64-linux; [
    (nerdfonts.override {fonts = ["Meslo" "JetBrainsMono"];})
    roboto
  ];

  # List services that you want to enable:
  services.locate.enable = true;
  services.locate.localuser = null;

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;
}
