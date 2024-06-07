{...}: {
  # Enable security services
  services.gnome.gnome-keyring.enable = true;
  security.polkit.enable = true;
  security.pam.services = {
    hyprlock = {};
    gdm.enableGnomeKeyring = true;
  };

  # List services that you want to enable:
  services.locate.enable = true;
  services.locate.localuser = null;
}
