{ config, pkgs, ... }:
let
  myAliases = {
      rehome = "home-manager switch --flake ~/.dotfiles";
      reflake = "sudo nixos-rebuild switch --flake ~/.dotfiles";
      "garbage collect" = "sudo nix-collect-garbage -d";
      hypfin = "hyprctl dispatch exit";
      ll = "ls -l";
      ".." = "cd ..";
    };
in
{

  programs.bash = {
    enable = true;
    shellAliases = myAliases;
  };

  programs.zsh = {
    enable = true;
    shellAliases = myAliases;
  };

}
