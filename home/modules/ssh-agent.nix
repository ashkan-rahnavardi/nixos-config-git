{
  config,
  pkgs,
  ...
}: {
  programs.ssh.startAgent = true;
  programs.ssh.addKeys = [
    {
      path = "/home/ash/.ssh/id_ed25519";
      askPass = false;
    }
  ];

  # You can also specify other ssh options here
  programs.ssh.extraConfig = ''
    Host github.com
      User git
      IdentityFile "/home/ash/.ssh/id_ed25519"
      AddKeysToAgent yes
  '';
}
