# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, inputs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./ashland.nix
#       ./hyprland-sys.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  environment.shells = with pkgs; [ zsh ];
  users.defaultUserShell = pkgs.zsh;
  programs.zsh.enable = true;

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/Vancouver";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_CA.UTF-8";

  # Enable the X11 windowing system.
  services.xserver = {
    enable = true;


  # Can't seem to get this to work
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

  # Enable the KDE Plasma Desktop Environment.
  services.displayManager.sddm.enable = true;
  services.xserver.desktopManager.plasma5.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable Bluetooth
  hardware.bluetooth.enable = true;		# enables support for bluetooth
  hardware.bluetooth.powerOnBoot = true;	# powers up the default Bluetooth controller on boot

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };


  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.ash = {
    isNormalUser = true;
    description = "ash";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      kate
      git
      xorg.xev
    ];
  };


  programs.firefox.enable = true;

  nixpkgs.config.allowUnfree = true;

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
    vim
    wget
  ];


  system.stateVersion = "23.11"; # Did you read the comment?


  nix.settings.experimental-features = ["nix-command" "flakes"];


}
