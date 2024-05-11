{pkgs, ...}:

{
    environment.systemPackages = [
        pkgs.vbam
        pkgs.retroarch
    ];
}