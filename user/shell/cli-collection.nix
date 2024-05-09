{ config, pkgs, ... }:
{
  # Collection of useful CLI apps
  home.packages = (with pkgs; [
    disfetch lolcat cowsay
    starfetch onefetch
    cava
    killall
    libnotify
    timer
    brightnessctl
    gnugrep gnused
    bat eza fd bottom ripgrep
    rsync
    unzip
    w3m
    fzf
    hwinfo
    pciutils
    vim neovim
    lazygit
  ]);
}
