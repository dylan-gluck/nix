{ config, lib, pkgs, ... }:

{

  stylix = {
    autoEnable = false;
    polarity = "dark";
    image = ../../wallpaper/wwdc-2023-8k-swirls-3840x2160-12596.jpg;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/tokyo-night-dark.yaml";
    cursor = {
      name = "macOS-BigSur";
      package = pkgs.apple-cursor;
      size = 24;
    };
    fonts = {
      monospace = {
        name = "ComicShannsMono Nerd Font";
        package = (pkgs.nerdfonts.override { fonts = [ "ComicShannsMono" ]; });
      };
      serif = {
        name = "ComicShannsMono Nerd Font";
        package = (pkgs.nerdfonts.override { fonts = [ "ComicShannsMono" ]; });
      };
      sansSerif = {
        name = "ComicShannsMono Nerd Font";
        package = (pkgs.nerdfonts.override { fonts = [ "ComicShannsMono" ]; });
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
  stylix.targets.gnome.enable = true;

}