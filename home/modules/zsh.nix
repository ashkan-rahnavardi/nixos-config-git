{pkgs, ...}: {
  # Zsh shell configuration
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    shellAliases = {
      cat = "bat -p";
      ff = "fastfetch";

      rr = "ranger";

      # git
      gaa = "git add --all";
      gcam = "git commit --all --message";
      gcl = "git clone";
      gco = "git checkout";
      ggl = "git pull";
      ggp = "git push";

      du = "dust";
      grep = "rg";

      poopoo = "wlr-randr --output DP-1 --mode 2560x1440@144";
      rehome = "home-manager switch --flake ~/.dotfiles";
      reflake = "sudo nixos-rebuild switch --flake ~/.dotfiles";
      "garbage collect" = "sudo nix-collect-garbage -d";
      hypfin = "hyprctl dispatch exit";

      ld = "lazydocker";
      lg = "lazygit";

      repo = "cd $HOME/Documents/repositories";
      temp = "cd $HOME/Downloads/temp";

      top = "btm";

      v = "nvim";
      vi = "nvim";
      vim = "nvim";

      ls = "eza --icons always"; # default view
      ll = "eza -bhl --icons --group-directories-first"; # long list
      la = "eza -abhl --icons --group-directories-first"; # all list
      lt = "eza --tree --level=2 --icons"; # tree
    };
    initExtra = ''
      # bindings
      bindkey -v
      bindkey -s ^f "cd-to-project\n"
      bindkey '^A' beginning-of-line
      bindkey '^E' end-of-line
      bindkey '^H' backward-delete-word
      bindkey '^[[1;5C' forward-word
      bindkey '^[[1;5D' backward-word
    '';
  };

  programs.starship = let
    flavour = "macchiato";
  in {
    enable = true;
    enableZshIntegration = true;
    settings =
      {
        add_newline = false;
        directory = {
          style = "bold lavender";
        };
        palette = "catppuccin_${flavour}";
      }
      // builtins.fromTOML (builtins.readFile
        (pkgs.fetchFromGitHub
          {
            owner = "catppuccin";
            repo = "starship";
            rev = "5629d2356f62a9f2f8efad3ff37476c19969bd4f";
            sha256 = "sha256-nsRuxQFKbQkyEI4TXgvAjcroVdG+heKX5Pauq/4Ota0=";
          }
          + /palettes/${flavour}.toml));
  };
}
