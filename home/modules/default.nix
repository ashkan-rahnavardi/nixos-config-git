{pkgs, ...}: {
  imports = [
    # ./modules/hyprland.nix
    ./alacritty.nix
    ./bat.nix
    ./bottom.nix
    ./fastfetch.nix
    ./fzf.nix
    ./git.nix
    ./gpg.nix
    ./gtk.nix
    ./lazygit.nix
     ./nixvim.nix
    # ./neovim.nix
    ./scripts.nix
    ./spicetify.nix
    ./tmux.nix
    ./zsh.nix
    ./ranger.nix
    ./nnn.nix
    ./kitty.nix
  ];
}
