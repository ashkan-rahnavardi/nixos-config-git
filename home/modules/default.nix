{pkgs, ...}: {
  imports = [
    # ./modules/hyprland.nix
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
    ./modules/kitty.nix
  ];
}
