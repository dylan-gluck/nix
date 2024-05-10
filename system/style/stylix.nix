{ config, lib, pkgs, inputs, ... }:

{
  imports = [ inputs.stylix.nixosModules.stylix ];

  stylix.autoEnable = true;
  
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

  programs.feh.enable = true;

  services.xserver.displayManager.lightdm = {
      greeters.slick.enable = true;
      greeters.slick.theme.name = "Adwaita-dark";
  };

  environment.sessionVariables = {
    QT_QPA_PLATFORMTHEME = "qt5ct";
  };

}