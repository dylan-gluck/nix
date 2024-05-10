{ pkgs, ... }:

{
  # import X11 config
  imports = [ ./x11.nix
              ./pipewire.nix
              ./dbus.nix
            ];

  # Display manager
  services.xserver = {
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
    defaultSession = "none+i3";
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