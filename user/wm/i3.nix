{config, lib, pkgs, ...}:

{
    xsession.windowManager.i3 = {
        enable = true;
        package = pkgs.i3-gaps;
        config = {
            modifier = "Mod4";

            fonts = [ "ComicShannsMono" ];

            gaps = {
                inner = 10;
                outer = 5;
            };
        };
    };
}