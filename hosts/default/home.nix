{config, pkgs, ...}:

{
  # Home Manager setup
  home.username = "d";
  home.homeDirectory = "/home/d";
  home.stateVersion = "23.11";

  programs.home-manager.enable = true;
  nixpkgs.config.allowUnfree = true;

  imports = [
    ../../user/wm/i3/i3.nix
    ../../user/shell/sh.nix
    ../../user/shell/cli-collection.nix
    ../../user/lang/cc/cc.nix
    ../../user/lang/python/python.nix
    ../../user/app/git/git.nix
    ../../user/app/ranger/ranger.nix
    ../../user/app/keepass/keepass.nix
    ../../user/app/virtualization/virtualization.nix
    ../../user/app/terminal/kitty.nix
    ../../user/app/terminal/alacritty.nix
    ../../user/hardware/bluetooth.nix
    ../../user/style/stylix.nix
  ];

  home.packages = with pkgs; [
    alacritty
    kitty
    firefox
    chromium
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

  home.sessionVariables = {
    EDITOR = "nvim";
    TERM = "kitty";
    BROWSER = "firefox";
  };

}