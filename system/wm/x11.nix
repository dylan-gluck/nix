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
      lightdm.enable = true;
      sessionCommands = ''
      xset -dpms
      xset s blank
      xset r rate 350 50
      xset s 300
      ${pkgs.lightlocker}/bin/light-locker --idle-hint &
    '';
    };
    
    libinput = {
      touchpad.disableWhileTyping = true;
    };
  };
}