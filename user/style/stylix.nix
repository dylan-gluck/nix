{ config, lib, pkgs, inputs, ... }:

{

  stylix = {
    autoEnable = true;
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

  stylix.targets.kitty.enable = true;
  stylix.targets.alacritty.enable = true;
  stylix.targets.gtk.enable = true;
  stylix.targets.rofi.enable = true;
  stylix.targets.feh.enable = true;
  stylix.targets.fish.enable = true;

  home.file.".currenttheme".text = "tokyo-night-dark";

  home.file.".fehbg-stylix".text = ''
    #!/bin/sh
    feh --no-fehbg --bg-fill ''+config.stylix.image+'';
  '';
  home.file.".fehbg-stylix".executable = true;
  
  home.file.".swaybg-stylix".text = ''
    #!/bin/sh
    swaybg -m fill -i ''+config.stylix.image+'';
  '';
  home.file.".swaybg-stylix".executable = true;
  
  home.file.".swayidle-stylix".text = ''
    #!/bin/sh
    swaylock_cmd='swaylock --indicator-radius 200 --screenshots --effect-blur 10x10'
    swayidle -w timeout 300 "$swaylock_cmd --fade-in 0.5 --grace 5" \
                timeout 600 'hyprctl dispatch dpms off' \
                resume 'hyprctl dispatch dpms on' \
                before-sleep "$swaylock_cmd"
    '';
  home.file.".swayidle-stylix".executable = true;
  
  home.file = {
    ".config/qt5ct/colors/oomox-current.conf".source = config.lib.stylix.colors {
      template = builtins.readFile ./oomox-current.conf.mustache;
      extension = ".conf";
    };
    ".config/Trolltech.conf".source = config.lib.stylix.colors {
      template = builtins.readFile ./Trolltech.conf.mustache;
      extension = ".conf";
    };
    ".config/kdeglobals".source = config.lib.stylix.colors {
      template = builtins.readFile ./Trolltech.conf.mustache;
      extension = "";
    };
    ".config/qt5ct/qt5ct.conf".text = pkgs.lib.mkBefore (builtins.readFile ./qt5ct.conf);
  };
  
  home.packages = with pkgs; [
     libsForQt5.qt5ct pkgs.libsForQt5.breeze-qt5 libsForQt5.breeze-icons
  ];
  
  qt = {
    enable = true;
    style.package = pkgs.libsForQt5.breeze-qt5;
    style.name = "breeze-dark";
    platformTheme = "gtk3";
  };
}
