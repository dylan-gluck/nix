{ config, pkgs, inputs,  ... }:

{
  imports =
    [ 
      ../../system/hardware-configuration.nix
      ../../system/hardware/kernel.nix
      ../../system/hardware/power.nix
      ../../system/hardware/time.nix
      ../../system/hardware/printing.nix
      ../../system/hardware/bluetooth.nix
      ../../system/hardware/nvidia.nix
      
      ../../system/wm/i3.nix
      ../../system/style/stylix.nix
      
      ../../system/app/virtualization.nix
      ../../system/app/docker.nix
      ../../system/app/flatpak.nix
      ../../system/app/steam.nix
      ../../system/app/gamemode.nix
      ../../system/app/prismlauncher.nix

      # ../../system/security/doas.nix
      ../../system/security/firewall.nix
      ../../system/security/firejail.nix
      ../../system/security/sshd.nix
      ../../system/security/gpg.nix
      ../../system/security/openvpn.nix
      ../../system/security/automount.nix

      inputs.home-manager.nixosModules.default
    ];

  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Set your time zone.
  time.timeZone = "America/New_York";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Enable networking
  networking.hostName = "msi"; 
  networking.networkmanager.enable = true;

  # Enable flakes
  nix.settings.experimental-features = ["nix-command" "flakes"];

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # User account
  users.users.d = {
    isNormalUser = true;
    description = "d";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = [];
    uid = 1000;
  };

  # Home manager init
  home-manager = {
      backupFileExtension = "backup";
      extraSpecialArgs = { inherit inputs; };
      users = {
          "d" = import ./home.nix;
      };
  };

  # System packages
  environment.systemPackages = with pkgs; [
    zsh
    vim
    wget
    git
    cryptsetup
    home-manager
    wpa_supplicant
  ];

  # System Variables
  environment.variables = {
    EDITOR = "nvim";
    TERM = "kitty";
    BROWSER = "firefox";
  };

  # Default Shell
  environment.shells = with pkgs; [ zsh ];
  users.defaultUserShell = pkgs.zsh;
  programs.zsh.enable = true;

  xdg.portal = {
    enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal
      pkgs.xdg-desktop-portal-gtk
    ];
    config.common.default = "*";
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?

}
