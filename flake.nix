{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix.url = "github:danth/stylix";
  };

  outputs = { self, nixpkgs, ... }@inputs: {
    nixosConfigurations.default = nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs; };
      extraSpecialArgs = { inherit inputs; };
      modules = [
        ./hosts/default/configuration.nix
        inputs.nixos-hardware.nixosModules.msi-gs60
        inputs.home-manager.nixosModules.default
        inputs.stylix.nixosModules.stylix
      ];
    };
  };
}