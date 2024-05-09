{ inputs, userSettings, ... }:

{
    imports = [
        ../default/configuration.nix
        ../../system/gpu/nvidia.nix
        ../../system/wm/i3.nix

        inputs.home-manager.nixosModules.msi
    ];

    # Home manager init
    home-manager = {
        extraSpecialArgs = { inherit inputs; };
        users = {
            ${userSettings.username} = import ./home.nix;
        };
    };
}