{ config, lib, pkgs, ... }:

{

  stylix = {
    autoEnable = false;
    polarity = "dark";
    image = ../../wallpaper/bg.jpg;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/tokyo-night-storm.yaml";
    fonts = {
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
  };

  stylix.targets.console.enable = true;
  stylix.targets.lightdm.enable = true;

}