{ config, lib, pkgs, inputs, ... }:

{
  imports = [ inputs.stylix.nixosModules.stylix ];

  imports = [ inputs.stylix.nixosModules.stylix ];

  stylix.autoEnable = false;
  
  stylix.polarity = "dark";

  stylix.image = ../../wallpaper/bg.jpg;

  stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/tokyo-night-storm.yaml";

  stylix.fonts = {
    monospace = {
      name = "Intel One Mono";
      package = pkgs.intel-one-mono;
    };
    serif = {
      name = "Intel One Mono";
      package = pkgs.intel-one-mono;
    };
    sansSerif = {
      name = "Intel One Mono";
      package = pkgs.intel-one-mono;
    };
    emoji = {
      name = "Noto Color Emoji";
      package = pkgs.noto-fonts-emoji-blob-bin;
    };
    sizes = {
      terminal = 12;
      applications = 12;
      popups = 12;
      desktop = 12;
    };
  };

  stylix.targets.console.enable = true;
  stylix.targets.lightdm.enable = true;

  stylix.targets.kitty.enable = true;
  stylix.targets.alacritty.enable = true;
  
  stylix.targets.i3.enable = true;
  stylix.targets.kde.enable = true;
  stylix.targets.gnome.enable = true;
  stylix.targets.gtk.enable = true;
  
  stylix.targets.rofi.enable = true;
  stylix.targets.feh.enable = true;

  programs.feh.enable = true;

  services.xserver.displayManager.lightdm = {
      greeters.slick.enable = true;
      greeters.slick.theme.name = myLightDMTheme;
  };

  environment.sessionVariables = {
    QT_QPA_PLATFORMTHEME = "qt5ct";
  };

}