{pkgs, ...}: {
  imports = [
    ./modules/hyprland.nix
    ./modules/alacritty.nix
    ./modules/bat.nix
    ./modules/bottom.nix
    ./modules/fastfetch.nix
    ./modules/fzf.nix
    ./modules/git.nix
    ./modules/gpg.nix
    ./modules/gtk.nix
    ./modules/lazygit.nix
    ./modules/neovim.nix
    ./modules/scripts.nix
    ./modules/spicetify.nix
    ./modules/tmux.nix
    ./modules/zsh.nix
    ./modules/ranger.nix
    ./modules/nnn.nix
    # ./modules/kitty.nix
  ];

  home.packages = with pkgs; [
    obsidian
    kitty
    firefox
    ferdium
    cava
    chromium
  ];

  # home.file.".local/bin/ueberzug".source = "${ueberzugpp}/bin/ueberzugpp";

  home = {
    username = "ash";
    homeDirectory = "/home/ash";
  };

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  nixpkgs.config.allowUnfree = true;

  programs.home-manager.enable = true;

  home.stateVersion = "24.05"; # Please read the comment before changing.
}
