{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, nixos-hardware, home-manager, ... }@inputs:

  {
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
          home-manager.nixosModules.msi
        ];
      };
    };
  };

}