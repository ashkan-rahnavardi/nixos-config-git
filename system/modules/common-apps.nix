{pkgs, ...}: {
  # List of common packages
  environment.systemPackages = with pkgs; [
    anki
    awscli2
    brave
    delta
    dig
    docker-compose
    du-dust
    eza
    fd
    gcc
    glib
    gnumake
    go
    helmfile
    jq
    killall
    kubectl
    kubernetes-helm
    lazydocker
    mesa
    nh
    obs-studio
    (python3.withPackages (ps:
      with ps; [
        pip
        virtualenv
      ]))
    pipenv
    pulseaudio
    qt6.qtwayland
    resources
    ripgrep
    sops
    telegram-desktop
    terraform
    terragrunt
    unzip
    wget
    wl-clipboard
    zoom-us
    kate
    xorg.xev # shows key output
    xorg.xmodmap # shows key mappings
    imagemagick
    file
    btop
    htop
  ];

  # Docker configuration
  virtualisation.docker.enable = true;
  virtualisation.docker.rootless = {
    enable = true;
    setSocketVariable = true;
  };

  # Install firefox.
  programs.firefox.enable = true;

  # Zsh configuration
  programs.zsh = {
    enable = true;
  };
}
