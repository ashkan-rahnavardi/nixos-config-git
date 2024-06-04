{ config, pkgs, ... }:
let
  myAliases = {
      rehome = "home-manager switch --flake .";
      reflake = "sudo nixos-rebuild switch --flake .";
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
