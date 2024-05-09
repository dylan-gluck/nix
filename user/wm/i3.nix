{config, lib, pkgs, ...}:

{
    xsession.windowManager.i3 = {
        enable = true;
        package = pkgs.i3-gaps;
        config = {

            startup = [
                { command = "picom" }
            ];

            terminal = "kitty";

            modifier = "Mod4";

            fonts = {
                names = [ "ComicShannsMono" ];
                style = "Regular Bold";
                size = 11.0;
            };

            defaultWorkspace = "workspace number 1";

            gaps = {
                inner = 10;
                outer = 5;
            };

            window = {
                titlebar = false;
                border = 1;
            };
        };
    };
}