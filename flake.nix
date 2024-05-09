{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, nixos-hardware, home-manager, ... }@inputs:

    let
    # System config variables
    systemSettings = {
      system = "x86_64-linux"; # system arch
      hostname = "msi"; # hostname
    };

    # User config variables
    userSettings = rec {
      username = "d";
      name = "d";
      editor = "nvim";
      term = "alactritty";
      browser = "firefox";
    };

    pkgs = import inputs.nixpkgs;

    in {
    # Systems 
    nixosConfigurations = {
      default = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        modules = [
          ./hosts/default/configuration.nix
        ];
      };
      msi = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        modules = [
          ./hosts/msi/configuration.nix
          nixos-hardware.nixosModules.msi-gs60
        ];
      };
    };
    # Profiles
    homeConfigurations = {
      user = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [
          ./hosts/msi/home.nix
        ];
        extraSpecialArgs = {
          inherit systemSettings;
          inherit userSettings;
          inherit inputs;
        };
      };
    };
  };

}
