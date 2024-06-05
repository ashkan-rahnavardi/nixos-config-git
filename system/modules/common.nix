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
    kernelPackages = pkgs.linuxPackages_latest;
    consoleLogLevel = 0;
    initrd.verbose = false;
    kernelParams = ["quiet" "splash"];
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


  # X11 settings
  services.xserver = {
    enable = true;
    xkb = {
      layout = "us";
      variant = "";
    };

    # Exclude certain default packages
    excludePackages = with pkgs; [xterm];

    # Enable KDE Plasma 5 Desktop Environment
    desktopManager.plasma5.enable = true;

    # Can't seem to get this to work, supposed to set refresh rate of main monitor early
#     xrandrHeads = [
#       {
#         output = "DP-1";
#         primary = true;
#         monitorConfig = ''
#           Option "PreferredMode" "2560x1440_144.00"
#         '';
#       }
#       {
#         output = "DP-2";
#         monitorConfig = ''
#           Option "Rotate" "inverted"
#         '';
#       }
#     ];

  };

  # Set SDDM as the default display manager
  services.displayManager.sddm.enable = true;

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
    extraGroups = [ "networkmanager" "wheel" "docker"];
    shell = pkgs.zsh;
  };

  # Enable passwordless sudo
  security.sudo.wheelNeedsPassword = false;

  # List of common packages
  environment.systemPackages = with pkgs; [
    anki
    awscli2
    brave
    delta
    dig
    docker-compose
    du-dust
    eza
    fd
    gcc
    glib
    gnumake
    go
    helmfile
    jq
    killall
    kubectl
    kubernetes-helm
    lazydocker
    mesa
    nh
    obs-studio
    (python3.withPackages (ps:
      with ps; [
        pip
        virtualenv
      ]))
    pipenv
    pulseaudio
    qt6.qtwayland
    resources
    ripgrep
    sops
    telegram-desktop
    terraform
    terragrunt
    unzip
    wget
    wl-clipboard
    zoom-us
  ];

  # Docker configuration
  virtualisation.docker.enable = true;
  virtualisation.docker.rootless = {
    enable = true;
    setSocketVariable = true;
  };

  # Zsh configuration
  programs.zsh = {
    enable = true;
  };

  # Fonts configuration
  fonts.packages = with inputs.nixpkgs-stable.legacyPackages.x86_64-linux; [
    (nerdfonts.override {fonts = ["Meslo" "JetBrainsMono"];})
    roboto
  ];

  # List services that you want to enable:
  services.locate.enable = true;
  services.locate.localuser = null;

#   # Enable the OpenSSH daemon.
#   services.openssh.enable = true;
}
