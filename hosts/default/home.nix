{config, pkgs, ...}:

{
  # Home Manager setup
  home.username = "d";
  home.homeDirectory = "/home/d";
  home.stateVersion = "23.11";
  programs.home-manager.enable = true;

  imports = [
    ../../user/shell/sh.nix
    ../../user/shell/cli-collection.nix
  ];

  home.packages = with pkgs; [
    alacritty
    kitty
    firefox
    librewolf
    vscode
    gnome.nautilus
    
    vlc
    mpv
    yt-dlp

    openvpn 
    ivpn

    gcc
    cargo
  ];

  xdg.enable = true;
  xdg.userDirs = {
    enable = true;
    createDirectories = true;
    music = "${config.home.homeDirectory}/Media/Music";
    videos = "${config.home.homeDirectory}/Media/Videos";
    pictures = "${config.home.homeDirectory}/Media/Pictures";
    templates = "${config.home.homeDirectory}/Templates";
    download = "${config.home.homeDirectory}/Downloads";
    documents = "${config.home.homeDirectory}/Documents";
    desktop = null;
    publicShare = null;
    extraConfig = {
      XDG_DOTFILES_DIR = "${config.home.homeDirectory}/.dotfiles";
      XDG_ARCHIVE_DIR = "${config.home.homeDirectory}/Archive";
      XDG_VM_DIR = "${config.home.homeDirectory}/Machines";
      XDG_ORG_DIR = "${config.home.homeDirectory}/Org";
      XDG_PODCAST_DIR = "${config.home.homeDirectory}/Media/Podcasts";
      XDG_BOOK_DIR = "${config.home.homeDirectory}/Media/Books";
    };
  };

  # xdg.mime.enable = true;
  # xdg.mimeApps.enable = true;
  # xdg.mimeApps.associations.added = {
  #   "application/octet-stream" = "flstudio.desktop;";
  # };

  # home.sessionVariables = {
  #   EDITOR = userSettings.editor;
  #   TERM = userSettings.term;
  #   BROWSER = userSettings.browser;
  # };

}