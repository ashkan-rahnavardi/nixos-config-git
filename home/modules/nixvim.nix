{
  inputs,
  lib,
  ...
}: let
  nixvim' = inputs.nixvim.packages."x86_64-linux".default;
  nvim = nixvim'.nixvimExtend {
    config = {
      theme = lib.mkForce "tokyonight";
    };
  };
in {
  home.packages = [
    nvim
  ];
}
