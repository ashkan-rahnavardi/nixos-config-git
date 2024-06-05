{
  config,
  pkgs,
  ...
}: {
  #Enable and configure ssh-agent
  programs.ssh = {
    enable = true;
    startAgent = true;
    extraConfig = ''
      AddKeysToAgent yes
      IdentifyFile /home/ash/.ssh/id_ed25519
    '';
  };

  home.sessionVariables = {
    GPG_TTY = "${pkgs.stdenv.shell} -c 'tty'";
    SSH_AUTH_SOCK = "${config.services.ssh-agent.socketPath}";
  };
}
