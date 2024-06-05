{ config, pkgs, inputs, lib, ... }:

{
  imports = [
    ./moudles/sh.nix
    ./moudles/hyprland.nix
    ./moudles/alacritty.nix
  ];

  programs.git = {
    enable = true;
    userName = "ash";
    userEmail = "ashkan.rahnavardi@gmail.com";
    extraConfig = {
      init.defaultBranch = "main";
    };
  };

  home.packages = with pkgs; [
    obsidian
  ];


  home = {
    username = "ash";
    homeDirectory = "/home/ash";
  };

  nixpkgs.config.allowUnfree = true;

  programs.home-manager.enable = true;

  home.stateVersion = "24.05"; # Please read the comment before changing.


}
