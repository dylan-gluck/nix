{ config, pkgs, lib, ... }:

{
    imports = [
        ../default/configuration.nix
        ../../system/gpu/nvidia.nix
        ../../system/wm/i3.nix
    ];
}