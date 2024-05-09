{config, lib, pkgs, ...}:

{
    xsession.windowManager.i3 = {
        enable = true;
        package = pkgs.i3-gaps;
        config = {
            modifier = "Mod4";

            fonts = [];

            gaps = {
                inner = 10;
                outer = 10;
            };

            keybindings = lib.mkOptionDefault {
                "Mod4+Enter" = "exec kitty";
            };
        }
    };
}