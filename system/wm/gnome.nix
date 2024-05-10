{pkgs, ...}:

{
  imports = [
    ./dbus.nix
    ./fonts.nix
  ];

  services.xserver = {
    enable = true;

    xkb = {
      variant = "";
      layout = "us";
    };

    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
  };

  environment.systemPackages = [
    pkgs.gnome.gnome-tweaks
    pkgs.gnomeExtensions.pop-shell
    pkgs.gnomeExtensions.zen
    pkgs.gnomeExtensions.just-perfection
    pkgs.gnomeExtensions.workspace-matrix
    pkgs.gnomeExtensions.workspaces-indicator-by-open-apps
    pkgs.gnomeExtensions.suppress-startup-animation
  ];

  environment.gnome.excludePackages = (with pkgs; [
    gnome-photos
    gnome-tour
    gedit # text editor
  ]) ++ (with pkgs.gnome; [
    cheese # webcam tool
    gnome-music
    gnome-terminal
    epiphany # web browser
    geary # email reader
    evince # document viewer
    gnome-characters
    totem # video player
    tali # poker game
    iagno # go game
    hitori # sudoku game
    atomix # puzzle game
  ]);
}