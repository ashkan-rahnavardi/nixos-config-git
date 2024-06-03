# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:


{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      home-manager.nixosModules.home-manager
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
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "us";
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;
  services.xserver.displayManager.sddm.enable = true;
  services.xserver.desktopManager.plasma5.enable = false; # Disable KDE Plasma
  services.xserver.windowManager.hyprland.enable = true;

  # Allow hardware acceleration for OpenGL.
  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };

  # Configure key swap for Dell XPS 13.
  # services.udev.extraRules = ''
  #   SUBSYSTEM=="input", ATTRS{name}=="AT Translated Set 2 keyboard", RUN+="/usr/bin/setxkbmap -option caps:swapescape"
  # '';

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.ash = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" ];
    packages = with pkgs; [
      firefox
      vim
    ];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound.
  sound.enable = true;
  hardware.pulseaudio.enable = true;

  # Enable the KDE environment.
  # services.xserver.displayManager.sddm.enable = true;
  # services.xserver.desktopManager.plasma5.enable = true;

  # Enable the NixOS firewall.
  networking.firewall.enable = true;

  # Define a profile to use common configurations across machines.
  # profiles.base = { pkgs, ... }: {
  #   environment.systemPackages = with pkgs; [
  #     vim
  #     wget
  #   ];
  #   services.openssh.enable = true;
  #   security.sudo.enable = true;
  # };

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
}

# {
#   imports =
#     [ # Include the results of the hardware scan.
#       ./hardware-configuration.nix
#     ];
#
#   # Bootloader.
#   boot.loader.systemd-boot.enable = true;
#   boot.loader.efi.canTouchEfiVariables = true;
#
#   environment.shells = with pkgs; [ zsh ];
#   users.defaultUserShell = pkgs.zsh;
#   programs.zsh.enable = true;
#
#   networking.hostName = "nixos"; # Define your hostname.
#   # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
#
#   # Configure network proxy if necessary
#   # networking.proxy.default = "http://user:password@proxy:port/";
#   # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";
#
#   # Enable networking
#   networking.networkmanager.enable = true;
#
#   # Set your time zone.
#   time.timeZone = "America/Vancouver";
#
#   # Select internationalisation properties.
#   i18n.defaultLocale = "en_CA.UTF-8";
#
#   # Enable the X11 windowing system.
#   services.xserver.enable = true;
#
#   # Enable the KDE Plasma Desktop Environment.
#   services.displayManager.sddm.enable = true;
#   services.xserver.desktopManager.plasma5.enable = true;
#
#   # Configure keymap in X11
#   services.xserver.xkb = {
#     layout = "us";
#     variant = "";
#   };
#
#   # Enable CUPS to print documents.
#   services.printing.enable = true;
#
#   # Enable Bluetooth
#   hardware.bluetooth.enable = true;		# enables support for bluetooth
#   hardware.bluetooth.powerOnBoot = true;	# powers up the default Bluetooth controller on boot
#
#   # Enable sound with pipewire.
#   sound.enable = true;
#   hardware.pulseaudio.enable = false;
#   security.rtkit.enable = true;
#   services.pipewire = {
#     enable = true;
#     alsa.enable = true;
#     alsa.support32Bit = true;
#     pulse.enable = true;
#     # If you want to use JACK applications, uncomment this
#     #jack.enable = true;
#
#     # use the example session manager (no others are packaged yet so this is enabled by default,
#     # no need to redefine it in your config for now)
#     #media-session.enable = true;
#   };
#
#   # Enable touchpad support (enabled default in most desktopManager).
#   # services.xserver.libinput.enable = true;
#
#   # Define a user account. Don't forget to set a password with ‘passwd’.
#   users.users.ash = {
#     isNormalUser = true;
#     description = "ash";
#     extraGroups = [ "networkmanager" "wheel" ];
#     packages = with pkgs; [
#       kate
#       git
#     #  thunderbird
#     ];
#   };
#
#   # Install firefox.
#   programs.firefox.enable = true;
#
#   # Allow unfree packages
#   nixpkgs.config.allowUnfree = true;
#
#   # List packages installed in system profile. To search, run:
#   # $ nix search wget
#   environment.systemPackages = with pkgs; [
#     vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
#     wget
#   ];
#
#   # Some programs need SUID wrappers, can be configured further or are
#   # started in user sessions.
#   # programs.mtr.enable = true;
#   # programs.gnupg.agent = {
#   #   enable = true;
#   #   enableSSHSupport = true;
#   # };
#
#   # List services that you want to enable:
#
#
#
#   # Enable the OpenSSH daemon.
#   # services.openssh.enable = true;
#
#   # Open ports in the firewall.
#   # networking.firewall.allowedTCPPorts = [ ... ];
#   # networking.firewall.allowedUDPPorts = [ ... ];
#   # Or disable the firewall altogether.
#   # networking.firewall.enable = false;
#
#   # This value determines the NixOS release from which the default
#   # settings for stateful data, like file locations and database versions
#   # on your system were taken. It‘s perfectly fine and recommended to leave
#   # this value at the release version of the first install of this system.
#   # Before changing this value read the documentation for this option
#   # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
#   system.stateVersion = "23.11"; # Did you read the comment?
#
#
#   nix.settings.experimental-features = ["nix-command" "flakes"];
#
#
# }
