{
  config,
  pkgs,
  ...
}: {
  #Enable and configure ssh-agent
  services.ssh-agent = {
    enable = true;
    identities = ["/home/ash/.ssh/id_ed25519"];
  };

  home.sessionVariables = {
    SSH_AUTH_SOCK = "${config.services.ssh-agent.socketPath}";
  };
}
