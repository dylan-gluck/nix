{ pkgs, ... }:

{
  # Define user account. 
  users.users.d = {
    isNormalUser = true;
    description = "d";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      firefox
      neovim
      vscode
      kitty
      neofetch
    ];
    shell = pkgs.fish;
  };
}