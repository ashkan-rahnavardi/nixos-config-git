{pkgs, ...}: {
  # List of common packages
  environment.systemPackages = with pkgs; [
    delta # Syntax highlighting pager for git
    dig # Gets DNS information
    docker-compose # Docker tool
    du-dust # CLI to view disk usage
    eza # Better list
    fd # Better Find
    gcc # GNU Compiler Collections
    glib # Low level system libraries
    gnumake # Build automation tool
    go # Golang
    jq # like `seq` but for JSON data
    killall # Command to terminate processes
    lazydocker # CLI Docker Management
    mesa # 3D Graphics Library
    nh # Nix Helper
    obs-studio # Screen Casting & Streaming
    (python3.withPackages (ps:
      with ps; [
        pip
        virtualenv
      ]))
    pipenv # Python Virtual Environment
    pulseaudio # Sound Server
    resources # Resource Managment / Viewer
    ripgrep # Better Grep
    unzip # Extract Zips
    wget # Retrieves content from web servers
    wl-clipboard # Wayland Clipboard
    kate # Text Editor
    xorg.xev # shows key output
    xorg.xmodmap # shows key mappings
    imagemagick # Image converter / tool
    file # Outputs actual file type
    btop # Better CLI Resource viewer
    htop # CLI Resource viewer
  ];

  # Docker configuration
  virtualisation.docker.enable = true;
  virtualisation.docker.rootless = {
    enable = true;
    setSocketVariable = true;
  };

  # # Install firefox.
  # programs.firefox.enable = true;

  # Zsh configuration
  programs.zsh = {
    enable = true;
  };
}
