{...}: let
  browser = "firefox.desktop";
in {
  xdg = {
    enable = true;

    mimeApps = {
      enable = true;
      associations.added = {
        "audio/mpeg" = ["org.gnome.Totem.desktop"];
        "image/jpeg" = ["org.gnome.Loupe.desktop"];
        "image/jpg" = ["org.gnome.Loupe.desktop"];
        "image/png" = ["org.gnome.Loupe.desktop"];
        "video/mp3" = ["mpv.desktop"];
        "video/mp4" = ["mpv.desktop"];
        "video/quicktime" = ["mpv.desktop"];
        "video/webm" = ["mpv.desktop"];
        # "video/mp3" = ["org.gnome.Totem.desktop"];
        # "video/mp4" = ["org.gnome.Totem.desktop"];
        # "video/quicktime" = ["org.gnome.Totem.desktop"];
        # "video/webm" = ["org.gnome.Totem.desktop"];
      };
      defaultApplications = {
        "application/x-extension-htm" = browser;
        "application/x-extension-html" = browser;
        "application/x-extension-shtml" = browser;
        "application/x-extension-xht" = browser;
        "application/x-extension-xhtml" = browser;
        "application/xhtml+xml" = browser;
        "text/html" = browser;
        "x-scheme-handler/about" = browser;
        "x-scheme-handler/chrome" = ["chromium-browser.desktop"];
        "x-scheme-handler/ftp" = browser;
        "x-scheme-handler/http" = browser;
        "x-scheme-handler/https" = browser;
        "x-scheme-handler/unknown" = browser;
        "inode/directory" = "org.gnome.Nautilus.desktop";
        "x-scheme-handler/file" = "org.gnome.Nautilus.desktop";

        "application/json" = ["gnome-text-editor.desktop"];
        "application/pdf" = browser;
        "application/toml" = "org.gnome.TextEditor.desktop";
        "application/x-gnome-saved-search" = ["org.gnome.Nautilus.desktop"];
        "audio/*" = ["mpv.dekstop"];
        "audio/mp3" = ["mpv.dekstop"];
        # "audio/*" = ["org.gnome.Totem.dekstop"];
        # "audio/mp3" = ["org.gnome.Totem.dekstop"];
        "image/*" = ["org.gnome.loupe.desktop"];
        "image/jpg" = ["org.gnome.loupe.desktop"];
        "image/png" = ["org.gnome.loupe.desktop"];
        "text/plain" = "org.gnome.TextEditor.desktop";
        "text/csv" = ["gnumeric.desktop"];
        "video/*" = ["mpv.dekstop"];
        "video/mp4" = ["mpv.dekstop"];
        # "video/*" = ["org.gnome.Totem.dekstop"];
        # "video/mp4" = ["org.gnome.Totem.dekstop"];
        "x-scheme-handler/spotify" = ["spotify.desktop"];
      };
    };

    userDirs = {
      enable = true;
      createDirectories = true;
    };
  };
}
