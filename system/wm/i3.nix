{ pkgs, ... }:

{
  # Display manager
  services.xserver = {
    enable = true;

    xkb = {
      variant = "";
      layout = "us";
    };

    desktopManager = {
       xterm.enable = false;
       xfce = {
         enable = true;
         noDesktop = true;
         enableXfwm = false;
       };
    };

    windowManager.i3 = {
       enable = true;
       extraPackages = with pkgs; [
         dmenu
         i3status
         i3lock
       ];
    };
  };

  services.displayManager = {
    defaultSession = "xfce+i3";
  };

  programs.dconf.enable = true;

  environment.pathsToLink = [ "/libexec" ];

  environment.systemPackages = with pkgs; [
    picom
    lxappearance
    feh # Wallpaper
    playerctl # Media control
  ];

  
}