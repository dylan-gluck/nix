{ config, pkgs, ... }:

{
  home.packages = [ pkgs.git ];
  programs.git.enable = true;
  programs.git.userName = "Dylan Navajas Gluck";
  programs.git.userEmail = "dylan.n.gluck@gmail.com";
  programs.git.extraConfig = {
    init.defaultBranch = "main";
    safe.directory = "/home/d/.dotfiles";
  };
}
