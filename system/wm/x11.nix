{ pkgs, ... }:

{
  imports = [ ./pipewire.nix
              ./dbus.nix
              ./gnome-keyring.nix
              ./fonts.nix
            ];

  # Configure X11
  services.xserver = {
    enable = true;
    
    xkb = {
      layout = "us";
      variant = "";
    };

    excludePackages = [ pkgs.xterm ];

    displayManager = {
      lightdm = {
        enable = true;
        greeters.slick.enable = true;
        greeters.slick.theme.name = "Adwaita-dark";
      };
      sessionCommands = ''
      xset -dpms
      xset s blank
      xset r rate 350 50
      xset s 300
      ${pkgs.lightlocker}/bin/light-locker --idle-hint &
    '';
    };
    
  };

  services.libinput = {
    touchpad.disableWhileTyping = true;
  };

  environment.sessionVariables = {
    QT_QPA_PLATFORMTHEME = "qt5ct";
  };

  xdg.portal = {
    enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal
      pkgs.xdg-desktop-portal-gtk
    ];
    config.common.default = "*";
  };
}
