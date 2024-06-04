{ config, pkgs, inputs, lib, ... }:

{
  imports = [
    ./sh.nix
    ./hyprland.nix
  ];

  home.username = "ash";
  home.homeDirectory = "/home/ash";


  nixpkgs.config.allowUnfree = true;


  programs.git = {
    enable = true;
    userName = "ash";
    userEmail = "ashkan.rahnavardi@gmail.com";
    extraConfig = {
      init.defaultBranch = "main";
    };
  };


  home.stateVersion = "24.05"; # Please read the comment before changing.



  home.packages = with pkgs; [
    obsidian
  ];



  programs.home-manager.enable = true;



}
